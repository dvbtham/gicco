﻿using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using Gicco.Module.Core.ViewModels;

namespace Gicco.Module.Core.Services
{
    public interface IThemeService
    {
        Task<IList<ThemeListItem>> GetInstalledThemes();

        Task SetCurrentTheme(string themeName);

        string PackTheme(string themeName);

        Task Install(Stream stream, string themeName);

        void Delete(string themeName);
    }
}
