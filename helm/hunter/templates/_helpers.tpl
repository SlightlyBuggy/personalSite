{{- define "hunter-portfolio.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "hunter-portfolio.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "hunter-portfolio.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{ include "hunter-portfolio.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "hunter-portfolio.selectorLabels" -}}
app.kubernetes.io/name: {{ include "hunter-portfolio.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
