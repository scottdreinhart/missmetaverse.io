import os
import re

specsDir = r'd:\Projects\missmetaverse.io\.obsidian-vault\specs'
excluded_patterns = ['00-index', 'AGENTS.md', 'README.md', 'patterns.md', 'stub.md', '_template-spec.md', 'Copilot-Consumption-Guide.md']

# Define principles with categorized subcategories
principles = {
    'solid': {
        'title': 'SOLID',
        'description': 'Five fundamental principles of object-oriented and functional programming design',
        'subcategories': {
            'Single Responsibility Principle (SRP)': [
                'single responsibility', 'responsibility', 'cohesion', 'focused', 'one reason'
            ],
            'Open/Closed Principle (OCP)': [
                'open closed', 'extension', 'modification', 'closed for modification', 'open for extension'
            ],
            'Liskov Substitution Principle (LSP)': [
                'liskov', 'substitution', 'subtype', 'behavioral subtyping', 'derived class'
            ],
            'Interface Segregation Principle (ISP)': [
                'interface segregation', 'interface', 'fat interface', 'lean interface', 'segregation'
            ],
            'Dependency Inversion Principle (DIP)': [
                'dependency inversion', 'dependency injection', 'inversion', 'abstraction', 'depends on abstractions'
            ],
            'Related Concepts': [
                'encapsulation', 'polymorphism', 'abstraction', 'inheritance', 'composition', 'coupling', 'cohesion'
            ]
        }
    },
    'clean': {
        'title': 'CLEAN',
        'description': 'Principles for writing maintainable, readable, and robust code',
        'subcategories': {
            'Clean Code': [
                'clean code', 'readable', 'meaningful names', 'comments', 'function size'
            ],
            'Clean Architecture': [
                'clean architecture', 'martin clean', 'independent of framework', 'independent of UI', 'independent of database'
            ],
            'Code Quality': [
                'naming conventions', 'code style', 'refactoring', 'simplicity', 'clarity'
            ],
            'Testing': [
                'testable', 'unit test', 'test driven', 'mocking', 'stub'
            ]
        }
    },
    'dry': {
        'title': 'DRY',
        'description': "Every piece of knowledge must have a single, unambiguous, authoritative representation",
        'subcategories': {
            "Don't Repeat Yourself": [
                'don\'t repeat yourself', 'deduplication', 'DRY', 'single source of truth'
            ],
            'Abstraction': [
                'abstraction', 'generalization', 'common', 'shared', 'extract'
            ],
            'Reusability': [
                'reusability', 'reusable', 'modular', 'component', 'library'
            ],
            'Configuration': [
                'configuration', 'environment', 'settings', 'constants', 'magic numbers'
            ]
        }
    },
    'acid': {
        'title': 'ACID',
        'description': 'Properties ensuring reliable database transactions',
        'subcategories': {
            'Atomicity': [
                'atomicity', 'all or nothing', 'transaction atomic', 'rollback'
            ],
            'Consistency': [
                'consistency', 'database consistency', 'transactional consistency', 'invariants'
            ],
            'Isolation': [
                'isolation', 'concurrent transactions', 'isolation level', 'dirty read', 'phantom read'
            ],
            'Durability': [
                'durability', 'persistent', 'commit', 'write ahead log', 'WAL'
            ],
            'Transaction Management': [
                'transaction', 'commit', 'rollback', 'two-phase commit', 'saga'
            ]
        }
    },
    'crud': {
        'title': 'CRUD',
        'description': 'Four basic operations for persistent storage management',
        'subcategories': {
            'Create': [
                'create', 'insert', 'POST', 'new resource', 'entity creation'
            ],
            'Read': [
                'read', 'retrieve', 'GET', 'query', 'fetch', 'lookup'
            ],
            'Update': [
                'update', 'modify', 'PUT', 'PATCH', 'edit', 'change'
            ],
            'Delete': [
                'delete', 'remove', 'DELETE', 'soft delete', 'archive'
            ],
            'Data Access': [
                'data access layer', 'repository', 'DAO', 'ORM', 'database'
            ]
        }
    },
    'atomic-design': {
        'title': 'ATOMIC DESIGN',
        'description': 'Methodology for creating design systems by breaking them into five distinct stages',
        'subcategories': {
            'Atoms': [
                'atom', 'basic element', 'button', 'input', 'label'
            ],
            'Molecules': [
                'molecule', 'atom combination', 'search form', 'card header'
            ],
            'Organisms': [
                'organism', 'complex component', 'header', 'footer', 'article'
            ],
            'Templates': [
                'template', 'page layout', 'wireframe', 'content structure'
            ],
            'Pages': [
                'page', 'final page', 'specific content', 'instance'
            ]
        }
    },
    'polp': {
        'title': 'POLP',
        'description': "Principle of Least Privilege — every module should operate with minimum privileges",
        'subcategories': {
            'Least Privilege': [
                'least privilege', 'minimum privilege', 'least authority', 'minimal access'
            ],
            'Access Control': [
                'access control', 'RBAC', 'ABAC', 'permissions', 'roles'
            ],
            'Security Boundaries': [
                'security boundary', 'isolation', 'sandbox', 'privilege separation'
            ],
            'Data Protection': [
                'data protection', 'encryption', 'secrets', 'credentials'
            ]
        }
    },
    'rbs': {
        'title': 'RBS',
        'description': 'Risk-Based Security — prioritizing security efforts based on risk assessment',
        'subcategories': {
            'Risk Assessment': [
                'risk assessment', 'threat modeling', 'risk analysis', 'vulnerability'
            ],
            'Security Prioritization': [
                'security priority', 'risk matrix', 'impact analysis', 'likelihood'
            ],
            'Mitigation Strategies': [
                'mitigation', 'risk treatment', 'controls', 'countermeasures'
            ],
            'Compliance': [
                'compliance', 'regulatory', 'audit', 'governance'
            ]
        }
    },
    'owasp': {
        'title': 'OWASP',
        'description': 'Open Web Application Security Project — top security risks and mitigation strategies',
        'subcategories': {
            'Injection': [
                'injection', 'SQL injection', 'command injection', 'input validation'
            ],
            'Broken Authentication': [
                'authentication', 'session management', 'credentials', 'MFA', 'OAuth'
            ],
            'Sensitive Data Exposure': [
                'data exposure', 'encryption', 'TLS', 'PII', 'data protection'
            ],
            'Broken Access Control': [
                'access control', 'authorization', 'privilege escalation', 'IDOR'
            ],
            'Security Misconfiguration': [
                'misconfiguration', 'hardening', 'defaults', 'security headers'
            ],
            'Cross-Site Scripting (XSS)': [
                'XSS', 'cross-site scripting', 'sanitization', 'CSP'
            ],
            'Insecure Deserialization': [
                'deserialization', 'object injection', 'unsafe unserialization'
            ],
            'Vulnerable Components': [
                'vulnerable components', 'dependency', 'CVE', 'SBOM', 'supply chain'
            ],
            'Insufficient Logging': [
                'logging', 'monitoring', 'audit trail', 'security events'
            ]
        }
    }
}

# Function to sanitize folder name
def sanitize_folder(name):
    return re.sub(r'[^a-z0-9\-]', '-', name.lower()).strip('-')

# Create enhanced indexes
created = 0
updated = 0

for slug, config in principles.items():
    # Find the folder by searching for existing files with this slug
    folder = None
    for root, dirs, files in os.walk(specsDir):
        for f in files:
            if f == f'{slug}.md' and not any(x in f for x in excluded_patterns):
                folder = os.path.relpath(root, specsDir).replace('\\', '/')
                break
        if folder:
            break
    
    if not folder:
        print(f"Skipping {slug} (folder not found)")
        continue
    
    index_path = os.path.join(specsDir, folder, f'{slug}.md')
    
    # Find related files by searching content
    related_files = {}  # category -> [files]
    
    for root, dirs, files in os.walk(specsDir):
        for f in files:
            if f.endswith('.md') and not any(x in f for x in excluded_patterns):
                path = os.path.join(root, f)
                if path == index_path:
                    continue
                
                try:
                    with open(path, 'r', encoding='utf-8') as fp:
                        content = fp.read().lower()
                    
                    rel_path = os.path.relpath(path, specsDir).replace('\\', '/')
                    
                    # Check which category this file belongs to
                    for category, keywords in config['subcategories'].items():
                        for keyword in keywords:
                            if keyword.lower() in content:
                                if category not in related_files:
                                    related_files[category] = []
                                if rel_path not in related_files[category]:
                                    related_files[category].append(rel_path)
                                break
                except:
                    pass
    
    # Create enhanced index content
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

{config['description']}

"""
    
    # Add categorized related notes
    if related_files:
        for category, files in sorted(related_files.items()):
            index_content += f"## {category}\n\n"
            for f in sorted(files)[:20]:  # Limit to 20 per category
                index_content += f"- [[{f}]]\n"
            index_content += "\n"
    else:
        index_content += "_No related notes found yet._\n\n"
    
    index_content += """## See Also

- [[Architecture]] — Main architecture notes
- [[Application Architecture]] — Application-level architecture patterns

---

*Conceptual index with categorized related notes*
"""
    
    # Write file
    with open(index_path, 'w', encoding='utf-8') as fp:
        fp.write(index_content)
    
    total_files = sum(len(files) for files in related_files.values())
    print(f"Updated: {slug} ({total_files} files in {len(related_files)} categories)")
    created += 1

print(f"\nUpdated {created} principle indexes with categorized notes")
