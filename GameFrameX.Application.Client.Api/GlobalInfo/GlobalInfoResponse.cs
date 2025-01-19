namespace GameFrameX.Application.Client.Api.GlobalInfo;

/// <summary>
/// 
/// </summary>
public sealed class GlobalInfoResponse
{
    /// <summary>
    /// 检测程序版本地址
    /// </summary>
    public string CheckAppVersionUrl { get; set; }

    /// <summary>
    /// 检测资源版本地址
    /// </summary>
    public string CheckResourceVersionUrl { get; set; }

    /// <summary>
    /// Aot 代码列表
    /// </summary>
    public string AotCodeList { get; set; }

    /// <summary>
    /// 附加内容。JSON对象
    /// </summary>
    public string Content { get; set; }
}