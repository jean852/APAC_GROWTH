# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'


# Seed data for Projects
PROJECTNAMES = [  "Asia Expansion Strategy",  "Penetrating New Markets in Asia",  "Southeast Asia Market Research",  "Asia-Pacific Business Plan",  "Investing in Asia's Emerging Markets",  "East Asia Feasibility Study",  "Asian Market Entry Strategy",  "Developing Partnerships in Asia",  "Asia-Pacific Expansion Plan",  "Asia-Pacific Investment Analysis",  "Asia Market Analysis & Insights",  "Expanding Business Horizons in Asia",  "Mapping Asia's Emerging Economies",  "Asia-Pacific Growth Strategy",  "Uncovering Opportunities in Asia",  "Asia-Pacific Competitive Landscape Analysis",  "Developing a Market Niche in Asia",  "East Asia Customer Segmentation Study",  "Asia-Pacific Sales Forecasting & Analysis",  "Exploring Untapped Markets in Asia"]
PROJECTDESCRIPTIONS = [
  "The Asia Expansion Strategy project involves researching and analyzing new markets in the Asia-Pacific region, and developing a comprehensive business plan for expansion. This project will require in-depth market research, competitive analysis, and customer segmentation studies to identify untapped markets and opportunities for growth.",
  "Penetrating New Markets in Asia involves identifying and analyzing new markets in the Asia-Pacific region, and developing a comprehensive market entry strategy. This project will require extensive market research, competitive analysis, and customer segmentation studies to identify the most promising markets and develop an effective entry strategy.",
  "The Southeast Asia Market Research project involves researching and analyzing key markets in Southeast Asia, including Thailand, Indonesia, and Malaysia. The project will involve in-depth market research, competitive analysis, and customer segmentation studies to identify untapped markets and opportunities for growth in the region.",
  "The Asia-Pacific Business Plan project involves developing a comprehensive business plan for expansion into the Asia-Pacific region. This project will require extensive market research, competitive analysis, and customer segmentation studies to identify the most promising markets and develop a strong business plan for expansion.",
  "Investing in Asia's Emerging Markets involves identifying and analyzing emerging markets in the Asia-Pacific region, and developing a comprehensive investment analysis. This project will require extensive market research, competitive analysis, and customer segmentation studies to identify the most promising investment opportunities and develop a sound investment strategy.",
  "The East Asia Feasibility Study project involves conducting a comprehensive feasibility study of key markets in East Asia, including China, Japan, and South Korea. This project will require in-depth market research, competitive analysis, and customer segmentation studies to identify the most promising markets and assess the feasibility of market entry.",
  "The Asian Market Entry Strategy project involves developing a comprehensive market entry strategy for key markets in Asia. This project will require extensive market research, competitive analysis, and customer segmentation studies to identify the most promising markets and develop an effective market entry strategy.",
  "Developing Partnerships in Asia involves identifying and analyzing potential partnership opportunities in the Asia-Pacific region, and developing a comprehensive partnership strategy. This project will require extensive market research, competitive analysis, and customer segmentation studies to identify the most promising partnership opportunities and develop a strong partnership strategy.",
  "The Asia-Pacific Expansion Plan project involves developing a comprehensive business plan for expansion into the Asia-Pacific region, with a focus on strategic growth opportunities. This project will require extensive market research, competitive analysis, and customer segmentation studies to identify the most promising markets and develop a strong business plan for expansion.",
  "The Asia-Pacific Investment Analysis project involves conducting a comprehensive investment analysis of key markets in the Asia-Pacific region. This project will require in-depth market research, competitive analysis, and customer segmentation studies to identify the most promising investment opportunities and develop a sound investment strategy.",
  "The Asia Market Analysis & Insights project involves researching and analyzing key markets in Asia, including China, India, and Southeast Asia. This project will require in-depth market research, competitive analysis, and customer segmentation studies to identify untapped markets and opportunities for growth in the region.",
  "Expanding Business Horizons in Asia involves researching and analyzing new markets in the Asia-Pacific region, and developing a comprehensive business plan for expansion. This project will require extensive market research, competitive analysis, and customer segmentation studies to identify untapped markets and opportunities for growth.",
  "Mapping Asia's Emerging Economies involves identifying and analyzing emerging economies in the Asia-Pacific region, and developing a comprehensive market entry strategy. This project will require extensive market research, competitive analysis, and customer segmentation studies to identify the most promising markets and develop an effective entry strategy.",
]




10.times do |n|
  project = Project.new(
    project_name: "Business Development Mission #{n + 1} in Asia",
    client_id: 2,
    company_id: 9,
    project_status: ["pending_validation", "rfp_stage", "pending_payment", "active", "pending_resolution", "closed", "cancelled"].sample,
    project_type: ["study", "b2b-single", "b2b-multi", "lead-generation"].sample,
    bidding_start: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    bidding_end: Faker::Date.between(from: 1.month.from_now, to: 3.months.from_now),
    rfp_status: "",
    project_start: Faker::Date.between(from: 3.months.from_now, to: 6.months.from_now),
    project_end: Faker::Date.between(from: 6.months.from_now, to: 12.months.from_now),
    project_budget: rand(2000..50000),
    project_price: rand(30000..500000),
    project_duration: rand(1..12),
    project_objective: PROJECTDESCRIPTIONS.sample,
    intros_quantity: rand(1..10),
    intros_type: ["phone", "email", "video", "irl_meeting"].sample(rand(1..3)),
    target_industries: Project::INDUSTRIES.sample(rand(1..3)),
    target_regions: Project::COUNTRIES.sample(rand(1..6)),
    target_type: ["company", "individual"].sample,
    target_size: ["small", "medium", "large"].sample(rand(1..2)),
    target_company: Faker::Company.name,
    target_url: Faker::Internet.url,
    target_country: Project::COUNTRIES.sample,
    target_name: Faker::Name.name,
    target_ideal: Faker::Lorem.sentence(word_count: 15),
    target_seniority: ["manager", "director", "executive"].sample(rand(1..2)),
    target_jobtitle: Array.new(rand(1..2)) { Faker::Job.field },
    study_elements: ["market analysis", "competitive landscape", "customer segmentation"].sample(rand(1..2)),
    study_deliverables: ["presentation", "report", "dashboard"].sample(rand(1..2)),
    project_expert_fee: rand(500..10000),
    project_platform_fee: rand(500..10000),
    project_payment_fee: rand(500..10000),
    parameter_incognito: [true, false].sample,
    parameter_terms: true,
  )
  project.save
end
