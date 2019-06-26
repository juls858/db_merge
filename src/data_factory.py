from azure.common.credentials import ServicePrincipalCredentials
from azure.mgmt.datafactory import DataFactoryManagementClient
from datetime import datetime, timedelta
import time
import pyhocon


class AzureDataFactoryCopy(object):
    conf = None

    def __init__(self):
        self.conf = pyhocon.ConfigFactory.parse_file('app.config')

    @staticmethod
    def _print_activity_run_details(activity_run):
        """Print activity run details."""
        print("\n\tActivity run details\n")
        print("\tActivity run status: {}".format(activity_run.status))
        if activity_run.status == 'Succeeded':
            print("pipeline has successfully run. Celebrate!!!")

    def run(self, source_db, user_db, server_db, sink_db, sink_schema, secret_db, sink_server, sink_secret, sink_user):

        # Azure subscription ID
        subscription_id = self.conf.get("azure.data_factory.subscription_id")
        resource_group_name = self.conf.get("azure.data_factory.resource_group")
        data_factory_name = self.conf.get("azure.data_factory.name")
        pipeline_name = self.conf.get("azure.data_factory.pipeline")

        # Specify your Active Directory client ID, client secret, and tenant ID
        credentials = ServicePrincipalCredentials(client_id=self.conf.get("azure.app"),
                                                  secret=self.conf.get("azure.client-secret"),
                                                  tenant=self.conf.get("azure.tenant"))
        adf_client = DataFactoryManagementClient(credentials, subscription_id)

        # Create a pipeline run
        run_response = adf_client.pipelines.create_run(resource_group_name, data_factory_name, pipeline_name,
                                                       {
                                                           "source_db": source_db,
                                                           "user_db": user_db,
                                                           "server_db": server_db,
                                                           "sink_db": sink_db,
                                                           "sink_schema": sink_schema,
                                                           "secret_db": secret_db,
                                                           "sink_server": sink_server,
                                                           "sink_secret": sink_secret,
                                                           "sink_user": sink_user
                                                       })

        # Monitor the pipeline run
        while True:
            pipeline_run = adf_client.pipeline_runs.get(resource_group_name, data_factory_name, run_response.run_id)
            print("\n\tPipeline run status: {}".format(pipeline_run.status))
            if pipeline_run.status == "InProgress":
                time.sleep(5)
                continue
            break

        activity_runs_paged = list(
            adf_client.activity_runs.list_by_pipeline_run(resource_group_name, data_factory_name, pipeline_run.run_id,
                                                          datetime.now() - timedelta(1),
                                                          datetime.now() + timedelta(1)))
        self._print_activity_run_details(activity_runs_paged[0])


if __name__ == '__main__':
    adf_copy = AzureDataFactoryCopy()
    adf_copy.run()
