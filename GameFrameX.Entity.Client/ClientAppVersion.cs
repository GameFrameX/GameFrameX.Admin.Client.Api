// GameFrameX 组织下的以及组织衍生的项目的版权、商标、专利和其他相关权利均受相应法律法规的保护。使用本项目应遵守相关法律法规和许可证的要求。
// 
// 本项目主要遵循 MIT 许可证和 Apache 许可证（版本 2.0）进行分发和使用。许可证位于源代码树根目录中的 LICENSE 文件。
// 
// 不得利用本项目从事危害国家安全、扰乱社会秩序、侵犯他人合法权益等法律法规禁止的活动！任何基于本项目二次开发而产生的一切法律纠纷和责任，我们不承担任何责任！

namespace GameFrameX.Entity.Client;

[SugarTable(null, "客户端程序版本配置表")]
public class ClientAppVersion : EntityBase
{
    /// <summary>
    /// 渠道
    /// </summary>
    [SugarColumn(ColumnDescription = "名称", Length = 64)]
    [Required, MaxLength(64)]
    public virtual string Channel { get; set; }

    /// <summary>
    /// 平台
    /// </summary>
    [SugarColumn(ColumnDescription = "平台", Length = 64)]
    [Required, MaxLength(64)]
    public virtual string Platform { get; set; }

    /// <summary>
    /// 版本
    /// </summary>
    [SugarColumn(ColumnDescription = "版本", Length = 64)]
    [Required, MaxLength(64)]
    public virtual string Version { get; set; }

    /// <summary>
    /// 包名
    /// </summary>
    [SugarColumn(ColumnDescription = "包名", Length = 64)]
    [Required, MaxLength(64)]
    public virtual string Package { get; set; }

    /// <summary>
    /// 语言
    /// </summary>
    [SugarColumn(ColumnDescription = "语言", Length = 64)]
    [Required, MaxLength(64)]
    public virtual string Language { get; set; }

    /// <summary>
    /// 旧版本
    /// </summary>
    [SugarColumn(ColumnDescription = "旧版本", Length = 64)]
    [MaxLength(64)]
    public string OldVersion { get; set; }

    /// <summary>
    /// 下载链接
    /// </summary>
    [SugarColumn(ColumnDescription = "下载链接", Length = 256)]
    [MaxLength(256)]
    public string DownloadUrl { get; set; }

    /// <summary>
    /// 是否强制更新
    /// </summary>
    [SugarColumn(ColumnDescription = "是否强制更新")]
    [Required]
    public bool IsForce { get; set; }

    /// <summary>
    /// 公告内容
    /// </summary>
    [SugarColumn(ColumnDescription = "公告内容", Length = 4096)]
    [MaxLength(4096)]
    public string Announcement { get; set; }

    /// <summary>
    /// 详细描述
    /// </summary>
    [SugarColumn(ColumnDescription = "详细描述", Length = 512)]
    [MaxLength(512)]
    public string Description { get; set; }
}