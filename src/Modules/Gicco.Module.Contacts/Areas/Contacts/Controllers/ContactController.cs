﻿using System.Linq;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;
using Gicco.Infrastructure.Data;
using Gicco.Module.Core.Extensions;
using Gicco.Module.Contacts.Models;
using Gicco.Module.Contacts.ViewModels;

namespace Gicco.Module.Contacts.Controllers
{
    [Area("Contacts")]
    public class ContactController : Controller
    {
        private readonly IRepository<Contact> _contactRepository;
        private readonly IRepository<ContactArea> _contactAreaRepository;
        private readonly IWorkContext _workContext;

        public ContactController(IRepository<Contact> contactRepository, IRepository<ContactArea> contactAreaRepository, IWorkContext workContext)
        {
            _contactRepository = contactRepository;
            _contactAreaRepository = contactAreaRepository;
            _workContext = workContext;
        }

        [Route("contact")]
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var model = new ContactVm()
            {
                ContactAreas = GetContactArea()
            };

            if(User.Identity.IsAuthenticated)
            {
                var currentUser = await _workContext.GetCurrentUser();
            
                model.FullName = currentUser.FullName;
                model.EmailAddress = currentUser.Email;
                model.PhoneNumber = currentUser.PhoneNumber;
            }

            return View(model);
        }

        [Route("contact")]
        [HttpPost]
        public IActionResult SubmitContact(ContactVm model)
        {
            if (ModelState.IsValid)
            {
                var contact = new Models.Contact()
                {
                    FullName = model.FullName,
                    PhoneNumber = model.PhoneNumber,
                    EmailAddress = model.EmailAddress,
                    Address = model.Address,
                    ContactAreaId = model.ContactAreaId,
                    Content = model.Content
                };

                _contactRepository.Add(contact);
                _contactRepository.SaveChanges();

                return View("SubmitContactResult", model);
            }

            model.ContactAreas = GetContactArea();

            return View("Index", model);
        }

        private IList<ContactAreaVm> GetContactArea()
        {
            var categories = _contactAreaRepository.Query()
                .Where(x => !x.IsDeleted)
                .Select(x => new ContactAreaVm()
                {
                    Id = x.Id,
                    Name = x.Name
                }).ToList();

            return categories;
        }
    }
}
