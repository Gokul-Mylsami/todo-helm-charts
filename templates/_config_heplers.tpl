{{- define "configmap-name"}}
{{- printf "%s-configmap" .Release.Name }}
{{- end }}

{{- define "configmap.values" -}}
PORT: "8000"
{{- $mongourl := include "mongo.service.name" . }}
{{- $backend_service_name := include "backend.service.name" . }}
MONGO_URL: {{ printf "mongodb://%s.default:27017/todo\n" $mongourl  }}
BACKEND_API: {{ printf "%s.%s:%s/api\n" $backend_service_name .Values.namespace (toString .Values.backend.service.port) }}

{{- end -}}