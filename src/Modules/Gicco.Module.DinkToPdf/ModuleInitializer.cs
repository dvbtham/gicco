﻿using DinkToPdf;
using DinkToPdf.Contracts;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Gicco.Infrastructure.Modules;
using Gicco.Module.Core.Services;

namespace Gicco.Module.DinkToPdf
{
    public class ModuleInitializer : IModuleInitializer
    {
        public void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.AddSingleton(typeof(IConverter), new SynchronizedConverter(new PdfTools()));
            serviceCollection.AddTransient<IPdfConverter, DinkToPdfConverter>();
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
        }
    }
}
