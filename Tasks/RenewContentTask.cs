using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Sitefinity.GenericContent.Model;
using Telerik.Sitefinity.Modules.News;
using Telerik.Sitefinity.News.Model;
using Telerik.Sitefinity.Scheduling;
using Telerik.Sitefinity.Workflow;

namespace SitefinityWebApp.Tasks
{
    public class RenewContentTask : ScheduledTask
    {
        /// <summary>
        /// TaskName
        /// </summary>
        public override string TaskName
        {
            get
            {
                return "SitefinityWebApp.Tasks.RenewContentTask";
            }
        }
        /// <summary>
        /// CreateTask
        /// </summary>
        public static void CreateTask()
        {
            SchedulingManager manager = SchedulingManager.GetManager();
            string title = "RenewContentTask";

            var tasks = manager.GetTaskData().Where(i => i.Title == title);
            foreach (var task in tasks)
            {
                manager.DeleteTaskData(task);
            }
            RenewContentTask newTask = new RenewContentTask()
            {
                Title = title,
                ExecuteTime = DateTime.UtcNow.AddMinutes(1),
            };
            manager.AddTask(newTask);
            manager.SaveChanges();
        }

        /// <summary>
        /// ExecuteTask
        /// </summary>
        public override void ExecuteTask()
        {
            NewsManager newsManager = NewsManager.GetManager();

            var masterNews = newsManager.GetNewsItems().Where(n => n.Status == ContentLifecycleStatus.Master);
            foreach (var master in masterNews)
            {
                NewsItem temp = newsManager.Lifecycle.CheckOut(master) as NewsItem;
                //Publish all articles within the current month
                temp.PublicationDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, temp.PublicationDate.Day);
                //If the articles are now in the future, publish then for the previous month instead
                if (temp.PublicationDate > DateTime.Now) temp.PublicationDate = temp.PublicationDate.AddMonths(-1);
                newsManager.Lifecycle.CheckIn(temp);
                newsManager.SaveChanges();
                var bag = new Dictionary<string, string>();
                bag.Add("ContentType", typeof(NewsItem).FullName);
                WorkflowManager.MessageWorkflow(master.Id, typeof(NewsItem), null, "Publish", false, bag);
            }
        }
    }
}