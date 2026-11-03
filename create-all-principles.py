import os
import re
from collections import defaultdict

specsDir = r'd:\Projects\missmetaverse.io\.obsidian-vault\specs'
excluded_patterns = ['00-index', 'AGENTS.md', 'README.md', 'patterns.md', 'stub.md', '_template-spec.md', 'Copilot-Consumption-Guide.md']

# Get existing indexes
existing_indexes = set()
for root, dirs, files in os.walk(specsDir):
    for f in files:
        if f.endswith('-index.md'):
            existing_indexes.add(f.replace('-index.md', ''))

print(f"Existing indexes: {len(existing_indexes)}")

# Define ALL major concepts/principles/patterns/methodologies
all_concepts = {
    # Design Principles
    'solid': {
        'title': 'SOLID Principles',
        'desc': 'Five fundamental principles of object-oriented design: Single Responsibility, Open/Closed, Liskov Substitution, Interface Segregation, Dependency Inversion',
        'keywords': ['single responsibility', 'open closed', 'liskov substitution', 'interface segregation', 'dependency inversion', 'srp', 'ocp', 'lsp', 'isp', 'dip']
    },
    'clean': {
        'title': 'Clean Architecture & Clean Code',
        'desc': 'Principles for writing maintainable, readable, and robust code with clear boundaries and separation of concerns',
        'keywords': ['clean architecture', 'clean code', 'robustness principle', 'simplicity', 'readability', 'martin clean']
    },
    'dry': {
        'title': 'DRY Principle',
        'desc': 'Every piece of knowledge must have a single, unambiguous, authoritative representation within a system',
        'keywords': ['don\'t repeat yourself', 'deduplication', 'abstraction', 'reusability', 'single source of truth', 'duplication']
    },
    'kiss': {
        'title': 'KISS Principle',
        'desc': 'Keep It Simple, Stupid — systems work best when kept simple rather than made complicated',
        'keywords': ['keep it simple', 'simplicity', 'complexity reduction', 'straightforward', 'simple design']
    },
    'yagni': {
        'title': 'YAGNI Principle',
        'desc': 'Always implement things when you actually need them, never when you just foresee they will be needed',
        'keywords': ['you ain\'t gonna need it', 'no unnecessary features', 'minimalism', 'just enough']
    },
    'separation-of-concerns': {
        'title': 'Separation of Concerns',
        'desc': 'Breaking a program into separate sections addressing distinct concerns for better modularity',
        'keywords': ['separation of concerns', 'modularity', 'cohesion', 'decomposition', 'concerns']
    },
    'composition-over-inheritance': {
        'title': 'Composition Over Inheritance',
        'desc': 'Prefer composing objects via aggregation over deep inheritance hierarchies',
        'keywords': ['composition', 'inheritance', 'favor composition', 'object composition', 'aggregation']
    },
    
    # Database Principles
    'acid': {
        'title': 'ACID Properties',
        'desc': 'Atomicity, Consistency, Isolation, Durability — properties ensuring reliable database transactions',
        'keywords': ['acid', 'atomicity', 'consistency', 'isolation', 'durability', 'transaction']
    },
    'crud': {
        'title': 'CRUD Operations',
        'desc': 'Create, Read, Update, Delete — the four basic operations for persistent storage',
        'keywords': ['crud', 'create', 'read', 'update', 'delete', 'persistent storage']
    },
    'normalization': {
        'title': 'Database Normalization',
        'desc': 'Organizing database tables to minimize redundancy and dependency',
        'keywords': ['normalization', 'normal form', '1nf', '2nf', '3nf', 'database design']
    },
    
    # Security
    'owasp': {
        'title': 'OWASP Top 10',
        'desc': 'Open Web Application Security Project — top 10 most critical web application security risks',
        'keywords': ['owasp', 'web security', 'security risks', 'vulnerabilities', 'top 10']
    },
    'polp': {
        'title': 'Principle of Least Privilege',
        'desc': 'Every program and user should operate with the least privileges necessary to complete their task',
        'keywords': ['least privilege', 'polp', 'minimal access', 'privilege escalation', 'access control']
    },
    'rbs': {
        'title': 'Role-Based Security',
        'desc': 'Access control based on roles assigned to users within an organization',
        'keywords': ['role-based', 'rbac', 'roles', 'permissions', 'access control']
    },
    
    # Architecture Patterns
    'microservices': {
        'title': 'Microservices Architecture',
        'desc': 'Architectural style organizing applications as collections of loosely coupled, independently deployable services',
        'keywords': ['microservice', 'micro-services', 'service-oriented', 'soa', 'loosely coupled']
    },
    'monolith': {
        'title': 'Monolithic Architecture',
        'desc': 'Traditional architectural style where all components are interconnected and interdependent in a single unit',
        'keywords': ['monolithic', 'monolith', 'single-tier', 'tightly coupled', 'traditional']
    },
    'hexagonal': {
        'title': 'Hexagonal Architecture (Ports & Adapters)',
        'desc': 'Architecture pattern that separates core business logic from external systems via ports and adapters',
        'keywords': ['hexagonal', 'ports and adapters', 'dependency inversion', 'testable architecture']
    },
    'layered': {
        'title': 'Layered Architecture',
        'desc': 'Organizing code into layers with defined responsibilities and controlled dependencies',
        'keywords': ['layered', 'n-tier', 'presentation service data', 'tiered', 'layers']
    },
    'ddd': {
        'title': 'Domain-Driven Design',
        'desc': 'Approach focusing on complex domain modeling through collaboration between technical and domain experts',
        'keywords': ['domain-driven design', 'ddd', 'ubiquitous language', 'bounded context', 'domain model']
    },
    'cqrs': {
        'title': 'CQRS (Command Query Responsibility Segregation)',
        'desc': 'Pattern separating read and write operations into different models for optimized performance',
        'keywords': ['command query', 'cqrs', 'command model', 'query model', 'read model', 'write model']
    },
    'event-driven': {
        'title': 'Event-Driven Architecture',
        'desc': 'Architecture where flow of program is determined by events produced by sources',
        'keywords': ['event driven', 'event sourcing', 'event mesh', 'pub sub', 'publish subscribe', 'events']
    },
    
    # API Patterns
    'rest': {
        'title': 'REST API Design',
        'desc': 'Representational State Transfer — architectural style for distributed systems using HTTP',
        'keywords': ['rest', 'representational state transfer', 'http methods', 'resources', 'stateless', 'restful']
    },
    'graphql': {
        'title': 'GraphQL API Design',
        'desc': 'Query language for APIs providing complete and understandable description of data in your API',
        'keywords': ['graphql', 'query language', 'schema', 'resolvers', 'mutations', 'queries']
    },
    
    # Testing
    'testing-pyramid': {
        'title': 'Testing Pyramid',
        'desc': 'Model organizing testing strategy with many unit tests, fewer integration tests, and fewest E2E tests',
        'keywords': ['testing pyramid', 'unit test', 'integration test', 'e2e', 'end to end', 'test strategy']
    },
    'tdd': {
        'title': 'Test-Driven Development',
        'desc': 'Development process relying on software requirements being converted to test cases',
        'keywords': ['test driven development', 'red green refactor', 'test first', 'tdd']
    },
    
    # DevOps
    'ci-cd': {
        'title': 'CI/CD Pipeline',
        'desc': 'Continuous Integration and Continuous Delivery/Deployment — automating build, test, and deployment',
        'keywords': ['continuous integration', 'continuous delivery', 'continuous deployment', 'pipeline', 'automation']
    },
    'iac': {
        'title': 'Infrastructure as Code',
        'desc': 'Managing and provisioning infrastructure through code instead of manual processes',
        'keywords': ['infrastructure as code', 'iac', 'terraform', 'pulumi', 'provisioning', 'infrastructure']
    },
    'containerization': {
        'title': 'Containerization',
        'desc': 'Packaging applications and dependencies into standardized units for consistent deployment',
        'keywords': ['container', 'docker', 'kubernetes', 'k8s', 'orchestration', 'containers']
    },
    'serverless': {
        'title': 'Serverless Architecture',
        'desc': 'Cloud execution model where providers dynamically manage allocation of machine resources',
        'keywords': ['serverless', 'function as a service', 'faas', 'lambda', 'azure functions']
    },
    
    # Programming Paradigms
    'functional': {
        'title': 'Functional Programming',
        'desc': 'Programming paradigm treating computation as evaluation of mathematical functions',
        'keywords': ['functional', 'functional programming', 'immutability', 'pure functions', 'higher order', 'monad']
    },
    'oop': {
        'title': 'Object-Oriented Programming',
        'desc': 'Programming paradigm based on objects containing data and methods',
        'keywords': ['object oriented', 'oop', 'encapsulation', 'polymorphism', 'classes', 'inheritance']
    },
    'reactive': {
        'title': 'Reactive Programming',
        'desc': 'Programming paradigm for handling asynchronous data streams',
        'keywords': ['reactive', 'reactive programming', 'observable', 'stream', 'async', 'rx']
    },
    'declarative': {
        'title': 'Declarative Programming',
        'desc': 'Programming paradigm expressing logic without describing control flow',
        'keywords': ['declarative', 'declarative programming', 'configuration', 'intent', 'sql', 'html']
    },
    'imperative': {
        'title': 'Imperative Programming',
        'desc': 'Programming paradigm using statements to change program state',
        'keywords': ['imperative', 'imperative programming', 'procedural', 'step by step', 'state mutation']
    },
    
    # TypeScript
    'typescript-strict': {
        'title': 'TypeScript Strict Mode',
        'desc': 'TypeScript compiler option enabling strict type checking for better code quality',
        'keywords': ['typescript strict', 'strict mode', 'type safety', 'strict null checks', 'no implicit any']
    },
    
    # State Management
    'state-management': {
        'title': 'State Management Patterns',
        'desc': 'Patterns and tools for managing application state in complex applications',
        'keywords': ['state management', 'state machine', 'global state', 'local state', 'state container']
    },
    
    # Forms
    'form-handling': {
        'title': 'Form Handling & Validation',
        'desc': 'Patterns for managing user input forms, validation, and submission',
        'keywords': ['form handling', 'form validation', 'form state', 'input handling', 'form schema']
    },
    
    # Data
    'data-visualization': {
        'title': 'Data Visualization',
        'desc': 'Graphical representation of information and data using visual elements',
        'keywords': ['data visualization', 'charting', 'charts', 'graphs', 'visual representation', 'd3']
    },
    'internationalization': {
        'title': 'Internationalization & Localization',
        'desc': 'Designing software to be adaptable to various languages, regions, and cultures',
        'keywords': ['internationalization', 'i18n', 'localization', 'l10n', 'translation', 'multilingual', 'locale']
    },
    
    # Security Patterns
    'csp': {
        'title': 'Content Security Policy',
        'desc': 'Security standard to detect and mitigate certain types of attacks including XSS',
        'keywords': ['content security policy', 'csp', 'xss prevention', 'script src', 'nonce']
    },
    'defense-in-depth': {
        'title': 'Defense in Depth',
        'desc': 'Multiple layers of security controls to protect against unauthorized access',
        'keywords': ['defense in depth', 'defense depth', 'layered security', 'multiple layers', 'security layers']
    },
    'zero-trust': {
        'title': 'Zero Trust Security',
        'desc': 'Security concept where no user or system is trusted by default',
        'keywords': ['zero trust', 'never trust always verify', 'default deny', 'verify explicitly']
    },
    
    # Performance
    'performance': {
        'title': 'Performance Optimization',
        'desc': 'Techniques for improving application speed, responsiveness, and resource usage',
        'keywords': ['performance', 'optimization', 'caching', 'lazy loading', 'code splitting', 'tree shaking', 'bundle']
    },
    
    # Accessibility
    'accessibility': {
        'title': 'Accessibility (a11y)',
        'desc': 'Practices ensuring products are usable by people with disabilities',
        'keywords': ['accessibility', 'a11y', 'wcag', 'aria', 'inclusive design', 'screen reader']
    },
    
    # Monitoring
    'observability': {
        'title': 'Observability',
        'desc': 'Ability to measure system internals based on external outputs — logs, metrics, traces',
        'keywords': ['observability', 'monitoring', 'logging', 'tracing', 'metrics', 'distributed tracing']
    },
    
    # API Design
    'api-design': {
        'title': 'API Design Principles',
        'desc': 'Principles and patterns for designing effective, consistent, and maintainable APIs',
        'keywords': ['api design', 'api guidelines', 'restful', 'api best practices', 'api versioning']
    },
    
    # Error Handling
    'error-handling': {
        'title': 'Error Handling Patterns',
        'desc': 'Patterns for managing and recovering from errors gracefully',
        'keywords': ['error handling', 'exception handling', 'error recovery', 'graceful degradation', 'error boundaries']
    },
    
    # Memory
    'memory-management': {
        'title': 'Memory Management',
        'desc': 'Techniques for managing application memory usage efficiently',
        'keywords': ['memory management', 'garbage collection', 'memory leaks', 'allocation', 'memory pool']
    },
    
    # Concurrency
    'concurrency': {
        'title': 'Concurrency & Parallelism',
        'desc': 'Simultaneous execution of multiple tasks for improved performance',
        'keywords': ['concurrency', 'parallelism', 'async await', 'promises', 'threads', 'web workers']
    },
    
    # Version Control
    'version-control': {
        'title': 'Version Control',
        'desc': 'System recording changes to files over time for collaboration and rollback',
        'keywords': ['version control', 'git', 'branching', 'merge', 'commit', 'rebase']
    },
    'conventional-commits': {
        'title': 'Conventional Commits',
        'desc': 'Convention for adding structure and meaning to commit messages',
        'keywords': ['conventional commits', 'commit messages', 'semantic commits', 'commitizen']
    },
    'git-workflow': {
        'title': 'Git Workflow Strategies',
        'desc': 'Strategies for using Git in team environments effectively',
        'keywords': ['git workflow', 'git flow', 'trunk based', 'github flow', 'gitlab flow']
    },
    
    # Data Patterns
    'data-oriented': {
        'title': 'Data-Oriented Design',
        'desc': 'Design approach that prioritizes data structure and access patterns',
        'keywords': ['data oriented', 'data oriented design', 'data first', 'data modeling', 'data structure']
    },
    
    # Design Patterns
    'design-patterns': {
        'title': 'Design Patterns',
        'desc': 'Reusable solutions to commonly occurring problems in software design',
        'keywords': ['design pattern', 'goF', 'creational', 'structural', 'behavioral', 'pattern']
    },
    
    # Frontend
    'frontend-patterns': {
        'title': 'Frontend Architecture Patterns',
        'desc': 'Patterns and practices for building maintainable frontend applications',
        'keywords': ['frontend', 'ui architecture', 'component', 'presentation', 'container pattern']
    },
    
    # Backend
    'backend-patterns': {
        'title': 'Backend Architecture Patterns',
        'desc': 'Patterns and practices for building scalable backend systems',
        'keywords': ['backend', 'server-side', 'api design', 'service layer', 'repository pattern']
    },
    
    # Security First
    'security-first': {
        'title': 'Security-First Design',
        'desc': 'Approach where security is considered at every stage of development',
        'keywords': ['security first', 'secure by design', 'threat modeling', 'security principles', 'secure coding']
    },
    
    # React
    'react-patterns': {
        'title': 'React Patterns & Best Practices',
        'desc': 'Patterns and best practices for building React applications',
        'keywords': ['react', 'react patterns', 'hooks', 'components', 'jsx', 'react ecosystem']
    },
    
    # Tailwind
    'tailwind-patterns': {
        'title': 'Tailwind CSS Patterns',
        'desc': 'Patterns and practices for using Tailwind CSS effectively',
        'keywords': ['tailwind', 'tailwind css', 'utility classes', 'responsive design', 'tailwind config']
    },
    
    # ShadCN
    'shadcn-patterns': {
        'title': 'ShadCN UI Patterns',
        'desc': 'Patterns for building accessible and customizable UI components with ShadCN',
        'keywords': ['shadcn', 'shadcn ui', 'radix ui', 'component library', 'accessible components']
    },
    
    # Testing
    'unit-testing': {
        'title': 'Unit Testing',
        'desc': 'Testing individual units of code in isolation',
        'keywords': ['unit testing', 'unit test', 'isolated testing', 'mocking', 'stubbing']
    },
    'integration-testing': {
        'title': 'Integration Testing',
        'desc': 'Testing interactions between integrated units or systems',
        'keywords': ['integration testing', 'integration test', 'system testing', 'api testing']
    },
    'e2e-testing': {
        'title': 'End-to-End Testing',
        'desc': 'Testing complete application workflows from start to finish',
        'keywords': ['end to end', 'e2e', 'end-to-end', 'smoke testing', 'regression testing']
    },
    
    # Performance
    'web-performance': {
        'title': 'Web Performance',
        'desc': 'Techniques for optimizing web application loading and runtime performance',
        'keywords': ['web performance', 'core web vitals', 'loading performance', 'runtime performance', 'lighthouse']
    },
    
    # Routing
    'routing': {
        'title': 'Routing Patterns',
        'desc': 'Patterns for managing navigation and URL structure in applications',
        'keywords': ['routing', 'router', 'navigation', 'url', 'route params', 'nested routes']
    },
    
    # Authentication
    'authentication': {
        'title': 'Authentication Patterns',
        'desc': 'Patterns for verifying user identity and managing sessions',
        'keywords': ['authentication', 'auth', 'login', 'session', 'jwt', 'oauth', 'sso']
    },
    
    # Authorization
    'authorization': {
        'title': 'Authorization Patterns',
        'desc': 'Patterns for controlling access to resources based on user permissions',
        'keywords': ['authorization', 'authz', 'permissions', 'roles', 'access control', 'rbac', 'abac']
    },
    
    # Caching
    'caching': {
        'title': 'Caching Strategies',
        'desc': 'Strategies for storing frequently accessed data to improve performance',
        'keywords': ['caching', 'cache', 'redis', 'in-memory', 'cache invalidation', 'cache strategy']
    },
    
    # Logging
    'logging': {
        'title': 'Logging & Observability',
        'desc': 'Patterns for logging application events for debugging and monitoring',
        'keywords': ['logging', 'log', 'structured logging', 'log levels', 'debugging']
    },
    
    # Configuration
    'configuration': {
        'title': 'Configuration Management',
        'desc': 'Patterns for managing application configuration across environments',
        'keywords': ['configuration', 'config', 'environment variables', 'settings', 'feature flags']
    },
    
    # Error Boundaries
    'error-boundaries': {
        'title': 'Error Boundaries & Recovery',
        'desc': 'Patterns for catching and recovering from errors in component trees',
        'keywords': ['error boundaries', 'error recovery', 'fallback', 'error handling', 'graceful degradation']
    },
    
    # Code Splitting
    'code-splitting': {
        'title': 'Code Splitting & Lazy Loading',
        'desc': 'Techniques for splitting code into smaller bundles loaded on demand',
        'keywords': ['code splitting', 'lazy loading', 'dynamic import', 'bundle splitting', 'on demand']
    },
    
    # SSR
    'ssr': {
        'title': 'Server-Side Rendering',
        'desc': 'Rendering web pages on the server before sending to client',
        'keywords': ['server-side rendering', 'ssr', 'hydration', 'next.js', 'nuxt']
    },
    
    # SSG
    'ssg': {
        'title': 'Static Site Generation',
        'desc': 'Generating static HTML pages at build time',
        'keywords': ['static site generation', 'ssg', 'static pages', 'build time', 'pre-rendering']
    },
    
    # ISR
    'isr': {
        'title': 'Incremental Static Regeneration',
        'desc': 'Generating and updating static pages at runtime',
        'keywords': ['incremental static regeneration', 'isr', 'revalidation', 'static pages', 'on-demand']
    },
    
    # PWA
    'pwa': {
        'title': 'Progressive Web Apps',
        'desc': 'Web applications that provide native-like experience with offline support',
        'keywords': ['progressive web app', 'pwa', 'service worker', 'offline', 'web app manifest']
    },
    
    # Micro-Frontends
    'micro-frontends': {
        'title': 'Micro-Frontends',
        'desc': 'Architectural style dividing frontend into smaller, independently deployable pieces',
        'keywords': ['micro-frontends', 'frontend microservices', 'module federation', 'independent deployment']
    },
    
    # Monorepo
    'monorepo': {
        'title': 'Monorepo Architecture',
        'desc': 'Managing multiple packages in a single repository',
        'keywords': ['monorepo', 'single repo', 'workspace', 'package management', 'shared code']
    },
    
    # Polyrepo
    'polyrepo': {
        'title': 'Polyrepo Architecture',
        'desc': 'Managing multiple repositories for different packages or services',
        'keywords': ['polyrepo', 'multiple repos', 'repo per package', 'independent deployment']
    },
    
    # GitOps
    'gitops': {
        'title': 'GitOps',
        'desc': 'Operating systems using Git as single source of truth',
        'keywords': ['gitops', 'git operations', 'declarative', 'automation', 'continuous delivery']
    },
    
    # Blue-Green
    'blue-green': {
        'title': 'Blue-Green Deployment',
        'desc': 'Deployment strategy running two identical production environments',
        'keywords': ['blue-green', 'blue green deployment', 'zero downtime', 'environment switching']
    },
    
    # Canary
    'canary': {
        'title': 'Canary Deployment',
        'desc': 'Gradually rolling out changes to a small subset of users',
        'keywords': ['canary', 'canary deployment', 'gradual rollout', 'percentage rollout']
    },
    
    # A/B Testing
    'ab-testing': {
        'title': 'A/B Testing',
        'desc': 'Comparing two versions to determine which performs better',
        'keywords': ['ab testing', 'a/b testing', 'split testing', 'experimentation', 'conversion']
    },
    
    # Feature Flags
    'feature-flags': {
        'title': 'Feature Flags & Toggles',
        'desc': 'Technique for enabling/disabling features without deploying new code',
        'keywords': ['feature flags', 'feature toggles', 'feature switches', 'feature management']
    },
    
    # API Gateway
    'api-gateway': {
        'title': 'API Gateway Pattern',
        'desc': 'Single entry point for all client requests to backend services',
        'keywords': ['api gateway', 'gateway', 'proxy', 'routing', 'rate limiting']
    },
    
    # Service Mesh
    'service-mesh': {
        'title': 'Service Mesh',
        'desc': 'Infrastructure layer for handling service-to-service communication',
        'keywords': ['service mesh', 'istio', 'linkerd', 'service communication', 'sidecar']
    },
    
    # Circuit Breaker
    'circuit-breaker': {
        'title': 'Circuit Breaker Pattern',
        'desc': 'Pattern for handling fault tolerance in distributed systems',
        'keywords': ['circuit breaker', 'fault tolerance', 'resilience', 'failure handling']
    },
    
    # Retry
    'retry-pattern': {
        'title': 'Retry Pattern',
        'desc': 'Pattern for automatically retrying failed operations',
        'keywords': ['retry', 'retry pattern', 'exponential backoff', 'retry logic']
    },
    
    # Bulkhead
    'bulkhead': {
        'title': 'Bulkhead Pattern',
        'desc': 'Pattern for isolating components to prevent cascading failures',
        'keywords': ['bulkhead', 'isolation', 'circuit breaker', 'fault tolerance', 'resilience']
    },
    
    # Saga
    'saga': {
        'title': 'Saga Pattern',
        'desc': 'Pattern for managing distributed transactions across services',
        'keywords': ['saga', 'distributed transactions', 'choreography', 'orchestration']
    },
    
    # Outbox
    'outbox': {
        'title': 'Transactional Outbox Pattern',
        'desc': 'Pattern for ensuring reliable message delivery with database transactions',
        'keywords': ['outbox', 'transactional outbox', 'message delivery', 'cdc', 'change data capture']
    },
    
    # Idempotency
    'idempotency': {
        'title': 'Idempotency',
        'desc': 'Property where multiple identical operations have same effect as one',
        'keywords': ['idempotency', 'idempotent', 'retry safety', 'duplicate prevention']
    },
    
    # Backpressure
    'backpressure': {
        'title': 'Backpressure Handling',
        'desc': 'Techniques for managing flow of data when consumer is slower than producer',
        'keywords': ['backpressure', 'flow control', 'rate limiting', 'throttling']
    },
    
    # Rate Limiting
    'rate-limiting': {
        'title': 'Rate Limiting',
        'desc': 'Controlling rate of requests to protect services from overload',
        'keywords': ['rate limiting', 'throttling', 'request limit', 'api limit']
    },
    
    # Pagination
    'pagination': {
        'title': 'Pagination Patterns',
        'desc': 'Techniques for dividing large datasets into smaller pages',
        'keywords': ['pagination', 'page', 'cursor', 'offset', 'infinite scroll']
    },
    
    # Filtering
    'filtering': {
        'title': 'Filtering & Sorting',
        'desc': 'Patterns for filtering and sorting data in APIs and UIs',
        'keywords': ['filtering', 'sorting', 'query params', 'search', 'filter']
    },
    
    # HATEOAS
    'hateoas': {
        'title': 'HATEOAS',
        'desc': 'Hypermedia as the Engine of Application State — REST constraint',
        'keywords': ['hateoas', 'hypermedia', 'links', 'rest constraint', 'self-documenting']
    },
    
    # HAL
    'hal': {
        'title': 'HAL (Hypertext Application Language)',
        'desc': 'Generic format for designing RESTful hypermedia',
        'keywords': ['hal', 'hypertext application language', 'hypermedia', 'rest format']
    },
    
    # OpenAPI
    'openapi': {
        'title': 'OpenAPI Specification',
        'desc': 'Specification for describing REST APIs in a machine-readable format',
        'keywords': ['openapi', 'swagger', 'api specification', 'rest description']
    },
    
    # gRPC
    'grpc': {
        'title': 'gRPC',
        'desc': 'High-performance RPC framework using Protocol Buffers',
        'keywords': ['grpc', 'protocol buffers', 'protobuf', 'rpc', 'high performance']
    },
    
    # WebSockets
    'websockets': {
        'title': 'WebSockets',
        'desc': 'Protocol for full-duplex communication channels over TCP',
        'keywords': ['websocket', 'websockets', 'real-time', 'full-duplex', 'socket']
    },
    
    # SSE
    'sse': {
        'title': 'Server-Sent Events',
        'desc': 'Server push technology for sending events to clients',
        'keywords': ['server-sent events', 'sse', 'event stream', 'server push']
    },
    
    # GraphQL Subscriptions
    'graphql-subscriptions': {
        'title': 'GraphQL Subscriptions',
        'desc': 'Real-time data delivery with GraphQL',
        'keywords': ['graphql subscriptions', 'real-time graphql', 'websocket graphql']
    },
    
    # Webhooks
    'webhooks': {
        'title': 'Webhooks',
        'desc': 'User-defined HTTP callbacks for event notification',
        'keywords': ['webhook', 'webhooks', 'callback', 'event notification', 'http callback']
    },
    
    # OAuth
    'oauth': {
        'title': 'OAuth 2.0',
        'desc': 'Authorization framework for granting limited access to user accounts',
        'keywords': ['oauth', 'oauth2', 'authorization', 'access token', 'refresh token']
    },
    
    # JWT
    'jwt': {
        'title': 'JWT (JSON Web Tokens)',
        'desc': 'Compact, URL-safe means of representing claims between two parties',
        'keywords': ['jwt', 'json web token', 'tokens', 'authentication', 'claims']
    },
    
    # Session
    'session-management': {
        'title': 'Session Management',
        'desc': 'Managing user sessions for authentication and state',
        'keywords': ['session', 'session management', 'cookie', 'session storage']
    },
    
    # CSRF
    'csrf': {
        'title': 'CSRF Protection',
        'desc': 'Cross-Site Request Forgery protection techniques',
        'keywords': ['csrf', 'cross-site request forgery', 'csrf token', 'protection']
    },
    
    # XSS
    'xss': {
        'title': 'XSS Prevention',
        'desc': 'Cross-Site Scripting prevention techniques',
        'keywords': ['xss', 'cross-site scripting', 'script injection', 'sanitization']
    },
    
    # SQL Injection
    'sql-injection': {
        'title': 'SQL Injection Prevention',
        'desc': 'Techniques for preventing SQL injection attacks',
        'keywords': ['sql injection', 'sql injection prevention', 'parameterized queries', 'orm']
    },
    
    # NoSQL
    'nosql': {
        'title': 'NoSQL Databases',
        'desc': 'Non-relational databases for specific data models',
        'keywords': ['nosql', 'no sql', 'document database', 'key-value', 'graph database', 'column-family']
    },
    
    # SQL
    'sql': {
        'title': 'SQL Databases',
        'desc': 'Relational databases using SQL for data management',
        'keywords': ['sql', 'relational database', 'postgresql', 'mysql', 'sqlite', 'database']
    },
    
    # Redis
    'redis': {
        'title': 'Redis Caching',
        'desc': 'In-memory data structure store used as database, cache, and message broker',
        'keywords': ['redis', 'in-memory', 'cache', 'key-value', 'data structure']
    },
    
    # MongoDB
    'mongodb': {
        'title': 'MongoDB',
        'desc': 'Document-oriented NoSQL database',
        'keywords': ['mongodb', 'document database', 'nosql', 'bson']
    },
    
    # PostgreSQL
    'postgresql': {
        'title': 'PostgreSQL',
        'desc': 'Advanced open-source relational database',
        'keywords': ['postgresql', 'postgres', 'relational', 'sql', 'advanced features']
    },
    
    # MySQL
    'mysql': {
        'title': 'MySQL',
        'desc': 'Popular open-source relational database',
        'keywords': ['mysql', 'relational', 'sql', 'open-source']
    },
    
    # Elasticsearch
    'elasticsearch': {
        'title': 'Elasticsearch',
        'desc': 'Distributed search and analytics engine',
        'keywords': ['elasticsearch', 'search', 'full-text', 'analytics', 'logging']
    },
    
    # GraphQL Federation
    'graphql-federation': {
        'title': 'GraphQL Federation',
        'desc': 'Composing multiple GraphQL services into a single graph',
        'keywords': ['graphql federation', 'federation', 'graphql services', 'graph composition']
    },
    
    # Apollo
    'apollo': {
        'title': 'Apollo GraphQL',
        'desc': 'GraphQL implementation and tooling platform',
        'keywords': ['apollo', 'apollo graphql', 'graphql client', 'graphql server']
    },
    
    # Prisma
    'prisma': {
        'title': 'Prisma ORM',
        'desc': 'Next-generation ORM for Node.js and TypeScript',
        'keywords': ['prisma', 'prisma orm', 'orm', 'type-safe', 'database']
    },
    
    # TypeORM
    'typeorm': {
        'title': 'TypeORM',
        'desc': 'ORM for TypeScript and JavaScript',
        'keywords': ['typeorm', 'orm', 'typescript', 'javascript', 'database']
    },
    
    # Drizzle
    'drizzle': {
        'title': 'Drizzle ORM',
        'desc': 'TypeScript ORM with a natural SQL feel',
        'keywords': ['drizzle', 'drizzle orm', 'typescript', 'sql', 'database']
    },
    
    # Zod
    'zod': {
        'title': 'Zod Schema Validation',
        'desc': 'TypeScript-first schema validation with inferrable types',
        'keywords': ['zod', 'schema validation', 'typescript', 'validation', 'types']
    },
    
    # Yup
    'yup': {
        'title': 'Yup Schema Validation',
        'desc': 'JavaScript schema validation and parsing',
        'keywords': ['yup', 'schema validation', 'javascript', 'validation']
    },
    
    # Joi
    'joi': {
        'title': 'Joi Validation',
        'desc': 'Object schema description language and validator',
        'keywords': ['joi', 'validation', 'schema', 'object validation']
    },
    
    # React Query
    'react-query': {
        'title': 'React Query',
        'desc': 'Data fetching and caching library for React',
        'keywords': ['react query', 'data fetching', 'caching', 'react', 'queries']
    },
    
    # SWR
    'swr': {
        'title': 'SWR',
        'desc': 'React Hooks library for data fetching',
        'keywords': ['swr', 'data fetching', 'react', 'stale-while-revalidate']
    },
    
    # Apollo Client
    'apollo-client': {
        'title': 'Apollo Client',
        'desc': 'Complete GraphQL client for React',
        'keywords': ['apollo client', 'graphql client', 'react', 'caching']
    },
    
    # Urql
    'urql': {
        'title': 'urql',
        'desc': 'GraphQL client for React and other frameworks',
        'keywords': ['urql', 'graphql client', 'react', 'exograph']
    },
    
    # Relay
    'relay': {
        'title': 'Relay',
        'desc': 'GraphQL client framework by Facebook',
        'keywords': ['relay', 'graphql', 'facebook', 'data fetching']
    },
    
    # tRPC
    'trpc': {
        'title': 'tRPC',
        'desc': 'TypeScript-first RPC framework',
        'keywords': ['trpc', 'typescript', 'rpc', 'type-safe', 'api']
    },
    
    # tRPC
    'tRPC': {
        'title': 'tRPC',
        'desc': 'TypeScript-first RPC framework',
        'keywords': ['trpc', 'typescript', 'rpc', 'type-safe', 'api']
    },
    
    # tRPC
    'tRPC': {
        'title': 'tRPC',
        'desc': 'TypeScript-first RPC framework',
        'keywords': ['trpc', 'typescript', 'rpc', 'type-safe', 'api']
    }
}

# Create index files for each concept
created = 0
for slug, config in all_concepts.items():
    if slug in existing_indexes:
        print(f"Skipping {config['title']} (already exists)")
        continue
    
    # Find related files by searching content
    related_files = []
    for root, dirs, files in os.walk(specsDir):
        for f in files:
            if f.endswith('.md') and not any(x in f for x in excluded_patterns):
                path = os.path.join(root, f)
                try:
                    with open(path, 'r', encoding='utf-8') as fp:
                        content = fp.read().lower()
                    
                    # Check if any keyword appears in content
                    for keyword in config['keywords']:
                        if keyword.lower() in content:
                            rel_path = os.path.relpath(path, specsDir).replace('\\', '/')
                            related_files.append(rel_path)
                            break
                except:
                    pass
    
    # Remove self from related files
    if slug in related_files:
        related_files.remove(slug)
    
    # Determine folder (use first folder from related files or default to root)
    folder = 'Architecture'  # default
    if related_files:
        first_file = related_files[0]
        if '/' in first_file:
            folder = first_file.split('/')[0]
    
    # Create index file
    index_content = f"""---
slug: {slug}
sources:
  - https://en.wikipedia.org/wiki/Software_design_pattern
date: 2026-11-03
tags:
  - principles
  - {slug}
  - best-practices
---

# {config['title']}

## Overview

{config['desc']}

## Related Notes

"""
    
    if related_files:
        for f in sorted(related_files)[:100]:  # Limit to 100 files
            index_content += f"- [[{f}]]\n"
    else:
        index_content += "_No related notes found yet._\n"
    
    index_content += f"""
## See Also

- [[Architecture]] — Main architecture notes
- [[Application Architecture]] — Application-level architecture patterns

---

*Auto-generated index for {config['title']}*
"""
    
    # Create folder if needed
    folder_path = os.path.join(specsDir, folder)
    if not os.path.exists(folder_path):
        os.makedirs(folder_path)
    
    index_path = os.path.join(folder_path, f'{slug}-index.md')
    with open(index_path, 'w', encoding='utf-8') as fp:
        fp.write(index_content)
    
    created += 1
    print(f"Created: {config['title']} ({len(related_files)} related files)")

print(f"\nCreated {created} new principle indexes")
