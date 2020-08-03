Plan.find(1).update!(
  name: "Free",
  amount: 0,
  interval: "month",
  details: {
    features:
      [
        "Follow your favorite Influencers, Entrepreneurs, and Brands.",
        "Create and share your guides, reviews, recipes, and more with the community",
        "Keep track of your goals and progress.",
        "Share your photos.",
        "And so much more!"
      ]
  }
)

Plan.create!(
  name: "Pro",
  amount: 6000,
  interval: "year",
  details: {
    features:
      [
        "Browse with Dark Mode.",
        "Chat with your favorite Influencers, Entrepreneurs, and Brands.",
        "Receive exclusive offers.",
        "Support us as we grow our platform and community."
      ]
  }
)

Plan.create!(
  name: "Influencer",
  amount: 1500,
  interval: "month",
  details: {
    features:
      [
        "All the features of Pro, plus...",
        "Posts are shared across the Global Feed.",
        "Advertise with other Entrepreneurs and Brands.",
        "Support available 3-days per week."
      ]
  }
)

Plan.create!(
  name: "Entrepreneur",
  amount: "3000",
  interval: "month",
  details: {
    features:
      [
        "All the features of Influencer, plus...",
        "Showcase your Brand and product(s) to the entire community.",
        "Track user engagement through powerful analytics.",
        "Advertise with other Entrepreneurs and Brands.",
        "Priority support available 5-days per week."
      ]
  }
)
