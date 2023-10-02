#  =============================  Frontend deployment ================================

{{- define "frontend.deployment.name" -}}
{{- printf "%s-frontend-deployment" .Release.Name }}
{{- end}}

# Frontend selector
{{- define "frontend.deployment.selectorLabel" -}}
app.kubernetes.io/name: {{ include "frontend.deployment.name" . }}
app: {{ printf "client" }}
{{- end -}}

{{- define "frontend.deployment.env" -}}

{{- end -}}

# ============================= Frontend Service ======================================

{{- define "frontend.service.name" -}}
{{- printf "%s-frontend-service" .Release.Name }}
{{- end}}

#  =============================  Backend deployment ================================

{{- define "backend.deployment.name" -}}
{{- printf "%s-backend-deployment" .Release.Name}}
{{- end -}}

{{- define "backend.deployment.selectorLabel" -}}
app: {{ printf "server" }}
{{- end }}

# ============================= Backend Service ======================================

{{- define "backend.service.name" -}}
{{- printf "%s-backend-service" .Release.Name }}
{{- end}}

# ============================= Storage Class ======================================

{{- define "storageclass.name"}}
{{- printf "%s-storage-class" .Release.Name }}
{{- end}}

#  =============================  Mongo deployment ================================

{{- define "mongo.deployment.name" -}}
{{- printf "%s-mongo-deployment" .Release.Name}}
{{- end -}}

{{- define "mongo.deployment.selectorLabel" -}}
app.kubernetes.io/name: {{ include "mongo.deployment.name" . }}
app: {{ printf "mongo" }}
{{- end }}

# Volume mount
{{- define "mongo.deployment.volumeMounts" -}}
- name: {{ printf "%s-volume-mount" .Release.Name }}
  volumeMounts:
    mountPath: {{ printf "/data/db" }}
{{- end -}}

# Volume Ref
{{- define "mongo.deployment.volume" -}}
name: {{ printf "%s-volume-mount" .Release.Name }}
persistentVolumeClaim: 
    claimName: {{ printf "%s-pvc" .Release.Name }}
{{- end -}}

# ============================= Backend Service ======================================

{{- define "mongo.service.name" -}}
{{- printf "%s-mongo-service" .Release.Name }}
{{- end}}

# ============================= Mongo PV ======================================

{{- define "mongo.pv.name" -}}
{{- printf "%s-pv" .Release.Name -}}
{{- end -}}

# ============================= Mongo PV ======================================
{{- define "mongo.pvc.name" -}}
{{- printf "%s-pvc" .Release.Name -}}
{{- end -}}