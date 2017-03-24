from jenkinsapi.jenkins import Jenkins
from jenkinsapi.utils.crumb_requester import CrumbRequester


def get_server_instance():
    jenkins_url = 'http://10.10.16.160:8090'
    user = "admin"
    passwd = "sd-9898w"
    requester = CrumbRequester(baseurl=jenkins_url, username=user,
                               password=passwd)
    server = Jenkins(jenkins_url, username=user, password=passwd,
                     requester=requester)
    return server


def get_job_details():
    # Refer Example #1 for definition of function 'get_server_instance'
    server = get_server_instance()
    for job_name, job_instance in server.get_jobs():
        print 'Job Name:%s' % (job_instance.name)
        print 'Job Description:%s' % (job_instance.get_description())
        print 'Is Job running:%s' % (job_instance.is_running())
        print 'Is Job enabled:%s' % (job_instance.is_enabled())


def build_job():
    server = get_server_instance()
    job_name = "an-example"
    if (server.has_job(job_name)):
        job_instance = server.get_job(job_name)
        qi = job_instance.invoke()
        qi.block_until_complete()
        build = qi.get_build()
        print build

if __name__ == '__main__':
    print get_server_instance().version
    get_job_details()
    build_job()
