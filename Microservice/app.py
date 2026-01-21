from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return """
    <html>
      <head>
        <title>AKS Microservice</title>
        <style>
          body {
            font-family: Arial;
            background-color: #0f172a;
            color: #e5e7eb;
            text-align: center;
            padding-top: 80px;
          }
          h1 { color: #38bdf8; }
        </style>
      </head>
      <body>
        <h1> Hello Welcome to my web page</h1>
        <p>Deployed using Terraform + Kubernetes</p>
        <p>Backend: Azure Blob Terraform State</p>
      </body>
    </html>
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
