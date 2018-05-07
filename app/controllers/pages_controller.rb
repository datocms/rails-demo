class PagesController < ApplicationController
  GENERAL_INFO = <<~GRAPHQL
    generalInfo: generalInfo {
      siteName
      callToAction
      socialProfiles {
        name
        url
      }
    }
  GRAPHQL

  def homepage
    @data = query <<~GRAPHQL
      {
        #{GENERAL_INFO}

        homepage {
          quote
          slides {
            url
            title
            alt
          }
        }
        works: allWorks(filter: {showInHome: {eq: true}}) {
          title
          creationDate
          tags { name }
          image { url }
          showInHome
        }
      }
    GRAPHQL
  end

  def portfolio
    @data = query <<~GRAPHQL
      {
        #{GENERAL_INFO}

        portfolioPage {
          title
          heroImage { url }
          content
        }

        works: allWorks(filter: {showInHome: {eq: false}}) {
          title
          creationDate
          tags { name }
          image { url }
          showInHome
        }

        tags: allTags {
          name
        }
      }
    GRAPHQL
  end

  def about
    @data = query <<~GRAPHQL
      {
        #{GENERAL_INFO}

        aboutPage {
          title
          heroImage { url }
          content
        }

        skillGroups: allSkillGroups(orderBy: [position_ASC]) {
          title
          description
          image { url }
          skills {
            name
            value
          }
        }
      }
    GRAPHQL
  end

  def services
    @data = query <<~GRAPHQL
      {
        #{GENERAL_INFO}

        servicesPage {
          title
          heroImage { url }
          content
        }

        services: allServices(orderBy: [position_ASC]) {
          title
          image { url }
          description
        }

        testimonials: allTestimonials(orderBy: [position_ASC]) {
          name
          content
        }

        counters: allCounters(orderBy: [position_ASC]) {
          title
          value
          image { url }
        }
      }
    GRAPHQL
  end

  def contact
    @data = query <<~GRAPHQL
      {
        #{GENERAL_INFO}

        contactPage {
          title
          heroImage { url }
          content
          location {
            latitude
            longitude
          }
        }
      }
    GRAPHQL
  end
end

# skill_groups: allSkillGroups {
#   title
#   description
#   image {
#     url
#   }
#   skills {
#     title
#     value
#   }
# }
