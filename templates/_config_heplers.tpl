{{- define "configmap-name"}}
{{- printf "%s-configmap" .Release.Name }}
{{- end }}

{{- define "configmap.values" -}}
PORT: "3000"
{{- $mongourl := include "mongo.service.name" . }}
{{- $backend_service_name := include "backend.service.name" . }}
MONGO_URL: {{ printf "mongodb://%s.default:27017/todo\n" $mongourl  }}
REACT_APP_BACKEND_URL: {{ printf "http://%s.%s:8000/\n" $backend_service_name .Values.namespace }}
{{- end -}}