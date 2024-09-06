import dlt
import requests
import json
from pathlib import Path
import os

def _get_ads(url_for_search, params):
    headers = {"accept": "application/json"}
    response = requests.get(url_for_search, headers=headers, params=params)
    response.raise_for_status()  # check for http errors
    return json.loads(response.content.decode("utf8"))


@dlt.resource(write_disposition="replace")
def healthcare_job_ads_resource(params):

    url = "https://jobsearch.api.jobtechdev.se"
    url_for_search = f"{url}/search"

    for ad in _get_ads(url_for_search, params)["hits"]:
        yield ad


def run_pipeline(query, table_name):
    # specify the pipeline name, destination and dataset name when configuring pipeline,
    # otherwise the defaults will be used that are derived from the current script name
    pipeline = dlt.pipeline(
        pipeline_name='healthcare_job_ads',
        destination='snowflake',
        dataset_name='staging',
    )

    params = {"q": query, "limit": 100}

    load_info = pipeline.run(healthcare_job_ads_resource(params=params), table_name=table_name)
    print(load_info)



if __name__ == "__main__":
    working_directory = Path(__file__).parent
    os.chdir(working_directory)

    query = "läkare"
    table_name = "healthcare_job_ads"

    run_pipeline(query, table_name)
