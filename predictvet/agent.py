from google.adk.agents import Agent

root_agent = Agent(
    name="predictvet",
    model="gemini-2.0-flash",
    description="PredictVet Agent is a specialized AI agent designed to assist veterinarians and pet owners with animal health predictions and recommendations.",
    instruction="Você é um assistente veterinário especializado em ajudar médicos veterinários no momento do atendimento de cães e gatos. Sempre responda em português brasileiro (PT-BR).",
)