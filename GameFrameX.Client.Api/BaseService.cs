using System.Linq.Expressions;
using GameFrameX.Client.Api.SqlSugar;
using GameFrameX.Entity;

namespace GameFrameX.Client.Api
{
    /// <summary>
    /// 
    /// </summary>
    public class BaseService
    {
    }

    /// <summary>
    /// 
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class BaseService<T> : BaseService where T : EntityBase, new()
    {
        /// <summary>
        /// 
        /// </summary>
        protected readonly Repository<T> Repository;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="settings"></param>
        public BaseService(Repository<T> settings)
        {
            this.Repository = settings;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="filter"></param>
        /// <returns></returns>
        public async Task<T> GetAsync(Expression<Func<T, bool>> filter)
        {
            return await Repository.AsQueryable().Where(m => m.IsDelete == false).FirstAsync(filter);
        }
    }
}