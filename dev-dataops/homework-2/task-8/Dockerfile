FROM coralogixrepo/coralogix-python-wrapper-and-exporter:27 AS coralogix
FROM public.ecr.aws/lambda/python:3.11

WORKDIR ${LAMBDA_TASK_ROOT}

COPY --from=coralogix /opt/ /opt/
