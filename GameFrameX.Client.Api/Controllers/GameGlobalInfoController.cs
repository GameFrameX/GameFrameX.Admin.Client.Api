using GameFrameX.Application.Api.GameApplicationVersion;
using GameFrameX.Client.Api.Result;
using GameFrameX.Entity.Client;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace GameFrameX.Client.Api.Controllers
{
    /// <summary>
    /// 全局信息控制器
    /// </summary>
    public class GameGlobalInfoController : BaseController<ClientGlobalInfo>
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="service"></param>
        public GameGlobalInfoController(BaseService<ClientGlobalInfo> service) : base(service)
        {
        }

        /// <summary>
        /// 获取全局信息
        /// </summary>
        /// <returns></returns>
        [ProducesResponseType(typeof(GlobalInfoResponse), 200)]
        [HttpPost]
        public async Task<HttpResult> GetInfo([FromBody] GlobalInfoRequest globalInfoRequest)
        {
            var response = new GlobalInfoResponse();
            ClientGlobalInfo gameGlobalInfo = await PBaseService.GetAsync(m =>
                m.Platform == globalInfoRequest.Platform
                && m.Package == globalInfoRequest.PackageName
                && m.Version == globalInfoRequest.AppVersion
                && m.Language == globalInfoRequest.Language
                && m.Channel == globalInfoRequest.Channel
            );

            if (gameGlobalInfo == null)
            {
                gameGlobalInfo = await PBaseService.GetAsync(m =>
                    m.Platform == globalInfoRequest.Platform
                    && m.Package == globalInfoRequest.PackageName
                    && m.Version == globalInfoRequest.AppVersion
                    && m.Channel == globalInfoRequest.Channel
                    && m.Language == ConstValue.LanguageDefault
                );
            }

            if (gameGlobalInfo == null)
            {
                gameGlobalInfo = await PBaseService.GetAsync(m =>
                    m.Platform == globalInfoRequest.Platform
                    && m.Package == globalInfoRequest.PackageName
                    && m.Version == globalInfoRequest.AppVersion
                    && m.Language == ConstValue.LanguageDefault
                    && (m.Channel == ConstValue.ChannelNameDefault || m.Channel == globalInfoRequest.Channel)
                );
            }

            if (gameGlobalInfo == null)
            {
                gameGlobalInfo = await PBaseService.GetAsync(m =>
                    m.Platform == globalInfoRequest.Platform
                    && m.Package == globalInfoRequest.PackageName
                    && m.Version == ConstValue.AppVersionDefault
                    && m.Language == ConstValue.LanguageDefault
                    && (m.Channel == ConstValue.ChannelNameDefault || m.Channel == globalInfoRequest.Channel)
                );
            }

            if (gameGlobalInfo == null)
            {
                gameGlobalInfo = await PBaseService.GetAsync(m =>
                    m.Platform == globalInfoRequest.Platform
                    && m.Package == ConstValue.PackageNameDefault
                    && m.Version == ConstValue.AppVersionDefault
                    && m.Language == ConstValue.LanguageDefault
                    && (m.Channel == ConstValue.ChannelNameDefault || m.Channel == globalInfoRequest.Channel)
                );
            }

            if (gameGlobalInfo == null)
            {
                gameGlobalInfo = await PBaseService.GetAsync(m =>
                    m.Platform == ConstValue.PlatformDefault
                    && m.Package == ConstValue.PackageNameDefault
                    && m.Version == ConstValue.AppVersionDefault
                    && m.Language == ConstValue.LanguageDefault
                    && (m.Channel == ConstValue.ChannelNameDefault || m.Channel == globalInfoRequest.Channel)
                );
            }

            if (gameGlobalInfo == null)
            {
                return HttpResult.Create(HttpStatusCode.NotFound, "not found");
            }

            response.Content = gameGlobalInfo.Content;
            response.CheckAppVersionUrl = gameGlobalInfo.CheckAppVersionUrl;
            response.CheckResourceVersionUrl = gameGlobalInfo.CheckResourceUrl;
            response.AotCodeList = gameGlobalInfo.AotCodeList;
            return HttpResult.Create(JsonConvert.SerializeObject(response));
        }
    }
}