output "webapp_url" {
  value = "${azurerm_windows_web_app.webapp.name}.azurewebsites.net"
}