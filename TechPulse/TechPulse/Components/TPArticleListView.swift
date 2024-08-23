//
//  TPArticleListView.swift
//  TechPulse
//
//  Created by RyanM on 8/16/24.
//

import SwiftUI
import Observation

struct ArticleObject: Identifiable, Hashable, Codable {
    let title: String
    let body: String
    
    var id: String { UUID().uuidString }
}

struct ArticleFactory {
    
    static var mock0: ArticleObject {
        ArticleObject(
            title: "Designing for Impact: 6 Ideas to Enhance the User Experience and Accessibility of Your Power BI",
            body: "A Journey Through the Design of an Equity, Diversity and Inclusion Power BI Dashboard."
        )
    }
    
    static var mock1: [ArticleObject] {
        [
            ArticleObject(
                title: "Designing for Impact: 6 Ideas to Enhance the User Experience and Accessibility of Your Power BI",
                body: "A Journey Through the Design of an Equity, Diversity and Inclusion Power BI Dashboard."
            ),
            
            ArticleObject(
                title: "Designing for Impact: 6 Ideas to Enhance the User Experience and Accessibility of Your Power BI",
                body: "A Journey Through the Design of an Equity, Diversity and Inclusion Power BI Dashboard."
            ),
            
            ArticleObject(
                title: "Designing for Impact: 6 Ideas to Enhance the User Experience and Accessibility of Your Power BI",
                body: "A Journey Through the Design of an Equity, Diversity and Inclusion Power BI Dashboard."
            ),
            
            ArticleObject(
                title: "Designing for Impact: 6 Ideas to Enhance the User Experience and Accessibility of Your Power BI",
                body: "A Journey Through the Design of an Equity, Diversity and Inclusion Power BI Dashboard."
            ),
            
            ArticleObject(
                title: "Designing for Impact: 6 Ideas to Enhance the User Experience and Accessibility of Your Power BI",
                body: "A Journey Through the Design of an Equity, Diversity and Inclusion Power BI Dashboard."
            ),
            
            ArticleObject(
                title: "Designing for Impact: 6 Ideas to Enhance the User Experience and Accessibility of Your Power BI",
                body: "A Journey Through the Design of an Equity, Diversity and Inclusion Power BI Dashboard."
            )
        ]
    }
    
    static let json: Data =
    """
    [
        {
            "title": "Understanding JavaScript Closures",
            "body": "Closures are a fundamental concept in JavaScript, allowing functions to access variables from an outer function scope."
        },
        {
            "title": "Introduction to REST APIs",
            "body": "REST APIs are a popular architectural style for networked applications, relying on stateless, client-server communication."
        },
        {
            "title": "The Basics of Machine Learning",
            "body": "Machine learning is a branch of artificial intelligence that focuses on building systems that learn from data."
        },
        {
            "title": "Getting Started with Python",
            "body": "Python is a versatile programming language known for its simplicity and wide range of applications."
        },
        {
            "title": "Exploring CSS Grid Layout",
            "body": "CSS Grid Layout is a powerful layout system available in CSS, enabling the creation of complex web layouts."
        },
        {
            "title": "Understanding Promises in JavaScript",
            "body": "Promises represent a value that may be available now, or in the future, or never in asynchronous operations."
        },
        {
            "title": "An Overview of React Hooks",
            "body": "React Hooks provide a way to use state and lifecycle features in functional components."
        },
        {
            "title": "Introduction to Git and GitHub",
            "body": "Git is a version control system, and GitHub is a platform for hosting and collaborating on Git repositories."
        },
        {
            "title": "The Importance of Cybersecurity",
            "body": "Cybersecurity involves protecting systems, networks, and programs from digital attacks."
        },
        {
            "title": "Introduction to Data Structures",
            "body": "Data structures are ways of organizing and storing data to efficiently perform operations on it."
        },
        {
            "title": "Understanding HTTP Methods",
            "body": "HTTP methods define the action to be performed on a resource in a RESTful API."
        },
        {
            "title": "Getting Started with Docker",
            "body": "Docker is a platform that allows developers to package applications into containers."
        },
        {
            "title": "Exploring the Python Standard Library",
            "body": "Python's standard library is a collection of modules and packages that come pre-installed with Python."
        },
        {
            "title": "Introduction to Cloud Computing",
            "body": "Cloud computing provides on-demand computing resources over the internet, such as storage and processing power."
        },
        {
            "title": "Understanding Big Data",
            "body": "Big Data refers to large volumes of data that can be analyzed for insights leading to better decisions."
        },
        {
            "title": "An Introduction to Kubernetes",
            "body": "Kubernetes is an open-source platform for automating the deployment, scaling, and management of containerized applications."
        },
        {
            "title": "Basics of Responsive Web Design",
            "body": "Responsive web design ensures that web pages render well on a variety of devices and window sizes."
        },
        {
            "title": "Understanding SQL and Databases",
            "body": "SQL (Structured Query Language) is used to manage and manipulate relational databases."
        },
        {
            "title": "Getting Started with TypeScript",
            "body": "TypeScript is a typed superset of JavaScript that compiles to plain JavaScript."
        },
        {
            "title": "The Role of APIs in Modern Applications",
            "body": "APIs (Application Programming Interfaces) allow different software systems to communicate and share data."
        }
    ]

    """.data(using: .utf8)!
    
    static var mock2: [ArticleObject] {
        var articles: [ArticleObject] = []
        do {
            articles = try JSONDecoder().decode([ArticleObject].self, from: json)
            print("ARTICLES: \(articles)")
        } catch {
            print("error: \(error.localizedDescription)")
        }
        return articles
    }
}

enum ArticleType {
    case dashboard
    case user
}

@Observable
final class TPArticleListViewModel {
    var articles: [ArticleObject]
    
    init() {
        articles = []
    }
    
    func loadArticle(articleType: ArticleType) {
        switch articleType {
        case .dashboard:
            articles = ArticleFactory.mock1
        case .user:
            articles = ArticleFactory.mock2
        }
    }
}

struct TPArticleListView: View {
    var articleType: ArticleType
    var selected: (ArticleObject) -> Void
    
    @State private var model = TPArticleListViewModel()
    @State private var selection = Set<ArticleObject>()
    
    var body: some View {
        List(model.articles) { article in
            Button {
                selected(article)
            } label: {
                ListItemView(article: article)
            }
            .buttonStyle(.borderless)
        }
        .onAppear {
            model.loadArticle(articleType: articleType)
        }
        .scrollIndicators(.hidden)
        .listStyle(.plain)
    }
}

#Preview {
    TPArticleListView(articleType: .user, selected: { _ in })
}
