using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using source.Interfaces;

namespace source.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class %temp%Controller : ControllerBase
    {
        private readonly ILogger<%temp%Controller> _logger;

        public %temp%Controller(ILogger<%temp%Controller> logger)
        {
            _logger = logger;
        }

    }
}
