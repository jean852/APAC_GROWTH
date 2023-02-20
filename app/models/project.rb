class Project < ApplicationRecord
  belongs_to :client, class_name: 'User'
  belongs_to :expert, class_name: 'User', optional: true
  belongs_to :company


  COUNTRIES = [
    "Singapore",
    "Indonesia",
    "Malaysia",
    "Thailand",
    "Philippines",
    "Cambodia",
    "Hong Kong",
    "Taiwan",
    "Vietnam"
  ]

  INDUSTRIES = [
    "Agriculture",
    "Arts",
    "Construction",
    "Consumer Goods",
    "Corporate Services",
    "Design",
    "Education",
    "Energy & Mining",
    "Entertainment",
    "Finance",
    "Hardware & Networking",
    "Health Care",
    "Legal",
    "Manufacturing",
    "Media & Communications",
    "Nonprofit",
    "Public Administration",
    "Public Safety",
    "Advertisements",
    "Real Estate",
    "Recreation & Travel",
    "Retail",
    "Software & IT Services",
    "Transportation & Logistics",
    "Wellness & Fitness"
  ]

  SUBINDUSTRIES = [
    { value: "advertisements", text: "Advertisements", group: "Advertisements" },
    { value: "dairy", text: "Dairy", group: "Agriculture" },
    { value: "farming", text: "Farming", group: "Agriculture" },
    { value: "fishery", text: "Fishery", group: "Agriculture" },
    { value: "ranching", text: "Ranching", group: "Agriculture" },
    { value: "arts_&_crafts", text: "Arts & Crafts", group: "Arts" },
    { value: "fine_art", text: "Fine Art", group: "Arts" },
    { value: "performing_arts", text: "Performing Arts", group: "Arts" },
    { value: "photography", text: "Photography", group: "Arts" },
    { value: "building_materials", text: "Building Materials", group: "Construction" },
    { value: "civil_engineering", text: "Civil Engineering", group: "Construction" },
    { value: "construction", text: "Construction", group: "Construction" },
    { value: "apparel_&_fashion", text: "Apparel & Fashion", group: "Consumer Goods" },
    { value: "advertisements", text: "Advertisements", group: "Consumer Goods" },
    { value: "consumer_electronics", text: "Consumer Electronics", group: "Consumer Goods" },
    { value: "consumer_goods", text: "Consumer Goods", group: "Consumer Goods" },
    { value: "consumer_services", text: "Consumer Services", group: "Consumer Goods" },
    { value: "cosmetics", text: "Cosmetics", group: "Consumer Goods" },
    { value: "food_&_beverages", text: "Food & Beverages", group: "Consumer Goods" },
    { value: "furniture", text: "Furniture", group: "Consumer Goods" },
    { value: "luxury_goods_&_jewelry", text: "Luxury Goods & Jewelry", group: "Consumer Goods" },
    { value: "sporting_goods", text: "Sporting Goods", group: "Consumer Goods" },
    { value: "tobacco", text: "Tobacco", group: "Consumer Goods" },
    { value: "wine_and_spirits", text: "Wine and Spirits", group: "Consumer Goods" },
    { value: "accounting", text: "Accounting", group: "Corporate Services" },
    { value: "business_supplies_&_equipment", text: "Business Supplies & Equipment", group: "Corporate Services" },
    { value: "environmental_services", text: "Environmental Services", group: "Corporate Services" },
    { value: "events_services", text: "Events Services", group: "Corporate Services" },
    { value: "executive_office", text: "Executive Office", group: "Corporate Services" },
    { value: "facilities_services", text: "Facilities Services", group: "Corporate Services" },
    { value: "human_resources", text: "Human Resources", group: "Corporate Services" },
    { value: "information_services", text: "Information Services", group: "Corporate Services" },
    { value: "management_consulting", text: "Management Consulting", group: "Corporate Services" },
    { value: "outsourcing/offshoring", text: "Outsourcing/Offshoring", group: "Corporate Services" },
    { value: "professional_training_&_coaching", text: "Professional Training & Coaching", group: "Corporate Services" },
    { value: "security_&_investigations", text: "Security & Investigations", group: "Corporate Services" },
    { value: "staffing_&_recruiting", text: "Staffing & Recruiting", group: "Corporate Services" },
    { value: "architecture_&_planning", text: "Architecture & Planning", group: "Design" },
    { value: "design", text: "Design", group: "Design" },
    { value: "graphic_design", text: "Graphic Design", group: "Design" },
    { value: "education_management", text: "Education Management", group: "Education" },
    { value: "e-learning", text: "E-Learning", group: "Education" },
    { value: "higher_education", text: "Higher Education", group: "Education" },
    { value: "primary/secondary_education", text: "Primary/Secondary Education", group: "Education" },
    { value: "research", text: "Research", group: "Education" },
    { value: "mining_&_metals", text: "Mining & Metals", group: "Energy and Mining" },
    { value: "oil_&_energy", text: "Oil & Energy", group: "Energy and Mining" },
    { value: "utilities", text: "Utilities", group: "Energy and Mining" },
    { value: "animation", text: "Animation", group: "Entertainment" },
    { value: "broadcast_media", text: "Broadcast Media", group: "Entertainment" },
    { value: "computer_games", text: "Computer Games", group: "Entertainment" },
    { value: "entertainment", text: "Entertainment", group: "Entertainment" },
    { value: "media_production", text: "Media Production", group: "Entertainment" },
    { value: "mobile_games", text: "Mobile Games", group: "Entertainment" },
    { value: "motion_pictures_&_film", text: "Motion Pictures & Film", group: "Entertainment" },
    { value: "music", text: "Music", group: "Entertainment" },
    { value: "banking", text: "Banking", group: "Finance" },
    { value: "capital_markets", text: "Capital Markets", group: "Finance" },
    { value: "financial_services", text: "Financial Services", group: "Finance" },
    { value: "insurance", text: "Insurance", group: "Finance" },
    { value: "investment_banking", text: "Investment Banking", group: "Finance" },
    { value: "investment_management", text: "Investment Management", group: "Finance" },
    { value: "venture_capital_&_private_equity", text: "Venture Capital & Private Equity", group: "Finance" },
    { value: "computer_hardware", text: "Computer Hardware", group: "Hardware and Networking" },
    { value: "computer_networking", text: "Computer Networking", group: "Hardware and Networking" },
    { value: "nanotechnologie", text: "Nanotechnologie", group: "Hardware and Networking" },
    { value: "semiconductors", text: "Semiconductors", group: "Hardware and Networking" },
    { value: "telecommunications", text: "Telecommunications", group: "Hardware and Networking" },
    { value: "wireless", text: "Wireless", group: "Hardware and Networking" },
    { value: "biotechnology", text: "Biotechnology", group: "Health Care" },
    { value: "hospital_&_health_care", text: "Hospital & Health Care", group: "Health Care" },
    { value: "medical_device", text: "Medical Device", group: "Health Care" },
    { value: "medical_practice", text: "Medical Practice", group: "Health Care" },
    { value: "mental_health_care", text: "Mental Health Care", group: "Health Care" },
    { value: "pharmaceuticals", text: "Pharmaceuticals", group: "Health Care" },
    { value: "veterinary", text: "Veterinary", group: "Health Care" },
    { value: "alternative_dispute_resolution", text: "Alternative Dispute Resolution", group: "Legal" },
    { value: "law_practice", text: "Law Practice", group: "Legal" },
    { value: "legal_services", text: "Legal Services", group: "Legal" },
    { value: "automotive", text: "Automotive", group: "Manufacturing" },
    { value: "aviation_&_aerospace", text: "Aviation & Aerospace", group: "Manufacturing" },
    { value: "chemicals", text: "Chemicals", group: "Manufacturing" },
    { value: "defense_&_space", text: "Defense & Space", group: "Manufacturing" },
    { value: "electrical_&_electronic_manufacturing", text: "Electrical & Electronic Manufacturing", group: "Manufacturing" },
    { value: "food_production", text: "Food Production", group: "Manufacturing" },
    { value: "glass,_ceramics_&_concrete", text: "Glass, Ceramics & Concrete", group: "Manufacturing" },
    { value: "industrial_automation", text: "Industrial Automation", group: "Manufacturing" },
    { value: "machinery", text: "Machinery", group: "Manufacturing" },
    { value: "mechanical_or_industrial_engineering", text: "Mechanical or Industrial Engineering", group: "Manufacturing" },
    { value: "packaging_&_containers", text: "Packaging & Containers", group: "Manufacturing" },
    { value: "paper_&_forest_products", text: "Paper & Forest Products", group: "Manufacturing" },
    { value: "plastics", text: "Plastics", group: "Manufacturing" },
    { value: "railroad_manufacture", text: "Railroad Manufacture", group: "Manufacturing" },
    { value: "renewables_&_environment", text: "Renewables & Environment", group: "Manufacturing" },
    { value: "shipbuilding", text: "Shipbuilding", group: "Manufacturing" },
    { value: "market_research", text: "Market Research", group: "Media and Communications" },
    { value: "marketing_&_advertising", text: "Marketing & Advertising", group: "Media and Communications" },
    { value: "newspapers", text: "Newspapers", group: "Media and Communications" },
    { value: "online_media", text: "Online Media", group: "Media and Communications" },
    { value: "printing", text: "Printing", group: "Media and Communications" },
    { value: "public_relations_&_communications", text: "Public Relations & Communications", group: "Media and Communications" },
    { value: "publishing", text: "Publishing", group: "Media and Communications" },
    { value: "translation_&_localization", text: "Translation & Localization", group: "Media and Communications" },
    { value: "writing_&_editing", text: "Writing & Editing", group: "Media and Communications" },
    { value: "civic_&_social_organization", text: "Civic & Social Organization", group: "Nonprofit" },
    { value: "fundraising", text: "Fundraising", group: "Nonprofit" },
    { value: "individual_&_family_services", text: "Individual & Family Services", group: "Nonprofit" },
    { value: "international_trade_&_development", text: "International Trade & Development", group: "Nonprofit" },
    { value: "libraries", text: "Libraries", group: "Nonprofit" },
    { value: "museums_&_institutions", text: "Museums & Institutions", group: "Nonprofit" },
    { value: "non-profit_organization_management", text: "Non-Profit Organization Management", group: "Nonprofit" },
    { value: "philanthropy", text: "Philanthropy", group: "Nonprofit" },
    { value: "program_development", text: "Program Development", group: "Nonprofit" },
    { value: "religious_institutions", text: "Religious Institutions", group: "Nonprofit" },
    { value: "think_tanks", text: "Think Tanks", group: "Nonprofit" },
    { value: "government_administration", text: "Government Administration", group: "Public Administration" },
    { value: "government_relations", text: "Government Relations", group: "Public Administration" },
    { value: "international_affairs", text: "International Affairs", group: "Public Administration" },
    { value: "judiciary", text: "Judiciary", group: "Public Administration" },
    { value: "legislative_office", text: "Legislative Office", group: "Public Administration" },
    { value: "political_organization", text: "Political Organization", group: "Public Administration" },
    { value: "public_policy", text: "Public Policy", group: "Public Administration" },
    { value: "law_enforcement", text: "Law Enforcement", group: "Public Safety" },
    { value: "military", text: "Military", group: "Public Safety" },
    { value: "public_safety", text: "Public Safety", group: "Public Safety" },
    { value: "commercial_real_estate", text: "Commercial Real Estate", group: "Real Estate" },
    { value: "real_estate", text: "Real Estate", group: "Real Estate" },
    { value: "airlines/aviation", text: "Airlines/Aviation", group: "Recreation and Travel" },
    { value: "gambling_&_casinos", text: "Gambling & Casinos", group: "Recreation and Travel" },
    { value: "hospitality", text: "Hospitality", group: "Recreation and Travel" },
    { value: "leisure,_travel_&_tourism", text: "Leisure, Travel & Tourism", group: "Recreation and Travel" },
    { value: "restaurants", text: "Restaurants", group: "Recreation and Travel" },
    { value: "recreational_facilities_&_services", text: "Recreational Facilities & Services", group: "Recreation and Travel" },
    { value: "sports", text: "Sports", group: "Recreation and Travel" },
    { value: "retail", text: "Retail", group: "Retail" },
    { value: "supermarkets", text: "Supermarkets", group: "Retail" },
    { value: "wholesale", text: "Wholesale", group: "Retail" },
    { value: "computer_&_network_security", text: "Computer & Network Security", group: "Software and IT Services" },
    { value: "computer_software", text: "Computer Software", group: "Software and IT Services" },
    { value: "information_technology_&_services", text: "Information Technology & Services", group: "Software and IT Services" },
    { value: "internet", text: "Internet", group: "Software and IT Services" },
    { value: "textiles", text: "Textiles", group: "Textiles" },
    { value: "import_&_export", text: "Import & Export", group: "Transportation and Logistics" },
    { value: "logistics_&_supply_chain", text: "Logistics & Supply Chain", group: "Transportation and Logistics" },
    { value: "maritime", text: "Maritime", group: "Transportation and Logistics" },
    { value: "package/freight_delivery", text: "Package/Freight Delivery", group: "Transportation and Logistics" },
    { value: "transportation/trucking/railroad", text: "Transportation/Trucking/Railroad", group: "Transportation and Logistics" },
    { value: "warehousing", text: "Warehousing", group: "Transportation and Logistics" },
    { value: "alternative_medicine", text: "Alternative Medicine", group: "Wellness and Fitness" },
    { value: "health,_wellness_&_fitness", text: "Health, Wellness & Fitness", group: "Wellness and Fitness" },
    ]

  STUDYELEMENTS = [
    {
      :service=>"Market Analysis",
      :description=>"Conduct a detailed analysis of the target market including the size, demographics, competition, demand for your product or service, and purchasing power of consumers.",
      :name=>"market_analysis"
    },
    {
      :service=>"Legal and Regulatory Framework",
      :description=>"Research the legal and regulatory environment of the target country or region. This includes identifying any legal barriers to entry, local laws and regulations that may affect your business, and any necessary permits and licenses.",
      :name=>"legal_and_regulatory_framework"
    },
    {
      :service=>"Cultural Analysis",
      :description=>"Understand the cultural nuances of the target market and how they may impact your business. This includes language, customs, and behaviors.",
      :name=>"cultural_analysis"
    },
    {
      :service=>"Economic Analysis",
      :description=>"Analyze the economic conditions of the target market including GDP, inflation, and economic growth rates. Determine the cost of doing business, availability of skilled labor, and the tax and financial policies of the target country or region.",
      :name=>"economic_analysis"
    },
    {
      :service=>"Political Analysis",
      :description=>"Assess the political stability of the target country or region and any potential risks associated with investing in the region.",
      :name=>"political_analysis"
    },
    {
      :service=>"Logistics and Infrastructure",
      :description=>"Evaluate the logistical and infrastructure needs for your business to operate successfully in the target market. This includes transportation, communication, and technology infrastructure.",
      :name=>"logistics_and_infrastructure"
    },
    {
      :service=>"Marketing and Sales Strategy",
      :description=>"Determine how you will promote and sell your product or service in the target market. This includes understanding the local marketing channels, sales channels, and pricing strategies.",
      :name=>"marketing_and_sales_strategy"
    },
    {
      :service=>"Financial Analysis",
      :description=>"Create a financial plan that outlines the costs associated with entering the target market, potential revenue streams, and the return on investment over time.",
      :name=>"financial_analysis"
    },
    {
      :service=>"Risk Analysis",
      :description=>"Identify and analyze potential risks associated with entering the target market and develop a risk management plan to mitigate those risks.",
      :name=>"risk_analysis"
    },
    {
      :service=>"Human Resources",
      :description=>"Develop a human resources plan that includes the recruitment and retention of local talent, compliance with local labor laws, and the training and development of your employees.",
      :name=>"human_resources"
    }
  ]

  DELIVERABLES = [
    {
      deliverable: 'Written Reports',
      description: 'Comprehensive report that summarizes the consultant\'s findings and recommendations',
      name: 'written_reports'
    },
    {
      deliverable: 'Presentations',
      description: 'Summary presentation of the key findings and recommendations of the study',
      name: 'presentations'
    },
    {
      deliverable: 'Data Sets',
      description: 'Raw data sets collected and analyzed by the consultant',
      name: 'data_sets'
    },
    {
      deliverable: 'Implementation Plans',
      description: 'Detailed plan for how to implement the consultant\'s recommendations',
      name: 'implementation_plans'
    },
    {
      deliverable: 'Training Materials',
      description: 'Materials to help your team adopt new processes or technologies',
      name: 'training_materials'
    },
    {
      deliverable: 'Follow-up Support',
      description: 'Ongoing support after the study is completed',
      name: 'follow-up_support'
    }
  ]

end
