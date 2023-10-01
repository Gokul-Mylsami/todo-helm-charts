{{- define "configmap-name"}}
{{- printf "%s-configmap" .Release.Name }}
{{- end }}

{{- define "configmap.values" -}}
PORT: "8000"
{{- $mongourl := include "mongo.service.name" . }}
{{- $backend_service_name := include "backend.service.name" . }}
MONGO_URL: {{ printf "mongodb://%s.default:27017/todo\n" $mongourl  }}
REACT_APP_BACKEND_URL: {{ printf "http://%s.%s:%s/api\n" $backend_service_name .Values.namespace (toString .Values.backend.service.port) }}
{{- end -}}