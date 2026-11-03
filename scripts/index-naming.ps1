# Index-Derived Naming Script
# Renames files to A01-Subject-Title.md pattern based on README identifiers

$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs"
$renameLog = @()

function Rename-FileWithIndex {
    param(
        [string]$FilePath,
        [string]$NewName,
        [string]$Reason
    )
    
    $oldPath = $FilePath
    $newPath = Join-Path (Split-Path $FilePath) $NewName
    
    try {
        Rename-Item -Path $oldPath -NewName $NewName -Force
        $renameLog += @{
            old = $oldPath
            new = $newPath
            reason = $Reason
        }
        Write-Host "OK $NewName" -ForegroundColor Green
    }
    catch {
        Write-Host "FAIL: $NewName - $($_.Exception.Message)" -ForegroundColor Red
    }
}

# ============================================================
# DDD Folder (C1-C16) -> C01-Concept-Name.md
# ============================================================
Write-Host "`n=== DDD Folder ===" -ForegroundColor Cyan
$dddDir = Join-Path $specsDir "DDD"
$dddFiles = Get-ChildItem $dddDir -Filter "*.md" | Where-Object { $_.Name -ne "README.md" -and $_.Name -ne "AGENTS.md" }

$dddMapping = @{
    "ubiquitous-language.md" = "C01-Ubiquitous-Language.md"
    "bounded-context.md" = "C02-Bounded-Context.md"
    "context-map.md" = "C03-Context-Map.md"
    "entity.md" = "C04-Entity.md"
    "value-object.md" = "C05-Value-Object.md"
    "aggregate.md" = "C06-Aggregate.md"
    "aggregate-root.md" = "C07-Aggregate-Root.md"
    "domain-invariant.md" = "C08-Domain-Invariant.md"
    "domain-service.md" = "C09-Domain-Service.md"
    "application-service.md" = "C10-Application-Service.md"
    "use-case.md" = "C11-Use-Case.md"
    "repository-ddd-pattern.md" = "C12-Repository-DDD-Pattern.md"
    "domain-event.md" = "C13-Domain-Event.md"
    "factory-ddd-pattern.md" = "C14-Factory-DDD-Pattern.md"
    "specification-ddd-pattern.md" = "C15-Specification-DDD-Pattern.md"
    "anti-corruption-layer.md" = "C16-Anti-Corruption-Layer.md"
}

foreach ($file in $dddFiles) {
    if ($dddMapping.ContainsKey($file.Name)) {
        Rename-FileWithIndex -FilePath $file.FullName -NewName $dddMapping[$file.Name] -Reason "DDD concept"
    }
}

# ============================================================
# Data Databases Folder (J1-J22) -> J01-Concept-Name.md
# ============================================================
Write-Host "`n=== Data Databases Folder ===" -ForegroundColor Cyan
$dataDbDir = Join-Path $specsDir "Data Databases"
$dataDbFiles = Get-ChildItem $dataDbDir -Filter "*.md" | Where-Object { $_.Name -ne "README.md" -and $_.Name -ne "AGENTS.md" }

$dataDbMapping = @{
    "normalization.md" = "J07-Normalization.md"
    "denormalization.md" = "J08-Denormalization.md"
    "referential-integrity.md" = "J09-Referential-Integrity.md"
    "db-constraints.md" = "J10-Database-Constraints.md"
    "transaction-boundaries.md" = "J11-Transaction-Boundaries.md"
    "pessimistic-cc.md" = "J13-Pessimistic-Concurrency-Control.md"
    "idempotency.md" = "J14-Idempotency.md"
    "schema-migrations.md" = "J15-Schema-Migrations.md"
    "expand-contract.md" = "J16-Expand-Contract-Migrations.md"
    "soft-delete.md" = "J17-Soft-Delete.md"
    "retention-policies.md" = "J18-Retention-Policies.md"
    "audit-trails.md" = "J19-Audit-Trails.md"
    "materialized-views.md" = "J21-Materialized-Views.md"
    "projections.md" = "J22-Projections.md"
}

foreach ($file in $dataDbFiles) {
    if ($dataDbMapping.ContainsKey($file.Name)) {
        Rename-FileWithIndex -FilePath $file.FullName -NewName $dataDbMapping[$file.Name] -Reason "Data database concept"
    }
}

# ============================================================
# Security Folder (M1-M17) -> M01-Concept-Name.md
# ============================================================
Write-Host "`n=== Security Folder ===" -ForegroundColor Cyan
$securityDir = Join-Path $specsDir "Security"
$securityFiles = Get-ChildItem $securityDir -Filter "*.md" | Where-Object { $_.Name -ne "README.md" -and $_.Name -ne "AGENTS.md" }

$securityMapping = @{
    "complete-mediation.md" = "M03-Complete-Mediation.md"
    "separation-of-duties.md" = "M06-Separation-of-Duties.md"
    "secure-by-design.md" = "M07-Secure-by-Design.md"
    "secure-defaults.md" = "M08-Secure-Defaults.md"
    "trust-boundaries.md" = "M09-Trust-Boundaries.md"
    "output-encoding.md" = "M11-Contextual-Output-Encoding.md"
    "parameterized-queries.md" = "M12-Parameterized-Queries.md"
    "rbac.md" = "M13-RBAC.md"
    "abac.md" = "M14-ABAC.md"
    "data-minimization.md" = "M15-Data-Minimization.md"
    "secrets-management.md" = "M16-Secrets-Management.md"
    "threat-modeling.md" = "M17-Threat-Modeling.md"
}

foreach ($file in $securityFiles) {
    if ($securityMapping.ContainsKey($file.Name)) {
        Rename-FileWithIndex -FilePath $file.FullName -NewName $securityMapping[$file.Name] -Reason "Security concept"
    }
}

# ============================================================
# Data-Driven Approaches Folder (K1-K9) -> K01-Concept-Name.md
# ============================================================
Write-Host "`n=== Data-Driven Approaches Folder ===" -ForegroundColor Cyan
$dataDrivenDir = Join-Path $specsDir "Data-Driven Approaches"
$dataDrivenFiles = Get-ChildItem $dataDrivenDir -Filter "*.md" | Where-Object { $_.Name -ne "README.md" -and $_.Name -ne "AGENTS.md" }

$dataDrivenMapping = @{
    "metadata-driven-ui.md" = "K04-Metadata-Driven-UI.md"
    "contract-first.md" = "K05-Contract-First-Development.md"
    "table-driven-logic.md" = "K07-Table-Driven-Logic.md"
    "data-oriented-design.md" = "K08-Data-Oriented-Design.md"
    "single-source-of-truth.md" = "K09-Single-Source-of-Truth.md"
}

foreach ($file in $dataDrivenFiles) {
    if ($dataDrivenMapping.ContainsKey($file.Name)) {
        Rename-FileWithIndex -FilePath $file.FullName -NewName $dataDrivenMapping[$file.Name] -Reason "Data-driven concept"
    }
}

# ============================================================
# APIs Distributed Systems Folder (L1-L22) -> L01-Concept-Name.md
# ============================================================
Write-Host "`n=== APIs Distributed Systems Folder ===" -ForegroundColor Cyan
$apiDir = Join-Path $specsDir "APIs Distributed Systems"
$apiFiles = Get-ChildItem $apiDir -Filter "*.md" | Where-Object { $_.Name -ne "README.md" -and $_.Name -ne "AGENTS.md" }

$apiMapping = @{
    "backward-compatibility.md" = "L03-Backward-Compatibility.md"
    "dtos.md" = "L04-Data-Transfer-Objects.md"
    "bff.md" = "L05-Backend-for-Frontend.md"
    "inbox-pattern.md" = "L08-Inbox-Pattern.md"
    "message-deduplication.md" = "L09-Message-Deduplication.md"
    "timeouts.md" = "L12-Timeouts.md"
    "cancellation.md" = "L13-Cancellation.md"
    "backpressure.md" = "L17-Backpressure.md"
    "read-through-cache.md" = "L19-Read-Through-Cache.md"
    "write-through-cache.md" = "L20-Write-Through-Cache.md"
}

foreach ($file in $apiFiles) {
    if ($apiMapping.ContainsKey($file.Name)) {
        Rename-FileWithIndex -FilePath $file.FullName -NewName $apiMapping[$file.Name] -Reason "API concept"
    }
}

# ============================================================
# Coding Type Systems Folder (N1-N15) -> N01-Concept-Name.md
# ============================================================
Write-Host "`n=== Coding Type Systems Folder ===" -ForegroundColor Cyan
$codingDir = Join-Path $specsDir "Coding Type Systems"
$codingFiles = Get-ChildItem $codingDir -Filter "*.md" | Where-Object { $_.Name -ne "README.md" -and $_.Name -ne "AGENTS.md" }

$codingMapping = @{
    "parse-dont-validate.md" = "N02-Parse-Don-t-Merely-Validate.md"
    "make-invalid-states-unrepresentable.md" = "N03-Make-Invalid-States-Unrepresentable.md"
    "discriminated-unions.md" = "N04-Discriminated-Unions.md"
    "exhaustive-handling.md" = "N05-Exhaustive-Handling.md"
    "immutability-coding.md" = "N06-Immutability.md"
    "pure-functions-coding.md" = "N07-Pure-Functions.md"
    "resource-lifecycle.md" = "N09-Resource-Lifecycle-Management.md"
    "structured-concurrency.md" = "N10-Structured-Concurrency.md"
    "boundary-validation.md" = "N11-Boundary-Validation.md"
    "small-cohesive-modules.md" = "N12-Small-Cohesive-Modules.md"
    "dependency-hygiene.md" = "N13-Dependency-Hygiene.md"
}

foreach ($file in $codingFiles) {
    if ($codingMapping.ContainsKey($file.Name)) {
        Rename-FileWithIndex -FilePath $file.FullName -NewName $codingMapping[$file.Name] -Reason "Coding concept"
    }
}

# ============================================================
# Quality Delivery Folder (O1-O15) -> O01-Concept-Name.md
# ============================================================
Write-Host "`n=== Quality Delivery Folder ===" -ForegroundColor Cyan
$qualityDir = Join-Path $specsDir "Quality Delivery"
$qualityFiles = Get-ChildItem $qualityDir -Filter "*.md" | Where-Object { $_.Name -ne "README.md" -and $_.Name -ne "AGENTS.md" }

$qualityMapping = @{
    "bdd.md" = "O02-Behavior-Driven-Development.md"
    "risk-based-testing.md" = "O03-Risk-Based-Testing.md"
    "property-based-testing.md" = "O04-Property-Based-Testing.md"
    "mutation-testing.md" = "O05-Mutation-Testing.md"
    "contract-testing.md" = "O06-Contract-Testing.md"
    "architecture-fitness.md" = "O07-Architecture-Fitness-Functions.md"
    "reproducible-builds.md" = "O09-Reproducible-Builds.md"
    "slo.md" = "O11-Service-Level-Objectives.md"
    "incremental-refactoring.md" = "O13-Incremental-Refactoring.md"
    "evolutionary-architecture.md" = "O14-Evolutionary-Architecture.md"
    "performance-budgets.md" = "O15-Performance-Budgets.md"
}

foreach ($file in $qualityFiles) {
    if ($qualityMapping.ContainsKey($file.Name)) {
        Rename-FileWithIndex -FilePath $file.FullName -NewName $qualityMapping[$file.Name] -Reason "Quality concept"
    }
}

# ============================================================
# Project File Conventions Folder (E1-E15) -> E01-Concept-Name.md
# ============================================================
Write-Host "`n=== Project File Conventions Folder ===" -ForegroundColor Cyan
$conventionsDir = Join-Path $specsDir "Project File Conventions"
$conventionsFiles = Get-ChildItem $conventionsDir -Filter "*.md" | Where-Object { $_.Name -ne "README.md" -and $_.Name -ne "AGENTS.md" }

$conventionsMapping = @{
    "view-file-convention.md" = "E01-View-File-Convention.md"
    "logic-file-convention.md" = "E02-Logic-File-Convention.md"
    "data-file-convention.md" = "E03-Data-File-Convention.md"
    "hook-file-convention.md" = "E04-Hook-File-Convention.md"
    "schema-file-convention.md" = "E05-Schema-File-Convention.md"
    "types-file-convention.md" = "E06-Types-File-Convention.md"
    "mapper-file-convention.md" = "E07-Mapper-File-Convention.md"
    "port-file-convention.md" = "E08-Port-File-Convention.md"
    "adapter-file-convention.md" = "E09-Adapter-File-Convention.md"
    "repository-file-convention.md" = "E10-Repository-File-Convention.md"
    "use-case-file-convention.md" = "E11-Use-Case-File-Convention.md"
    "entity-file-convention.md" = "E12-Entity-File-Convention.md"
    "value-object-file-convention.md" = "E13-Value-Object-File-Convention.md"
    "policy-file-convention.md" = "E14-Policy-File-Convention.md"
    "event-file-convention.md" = "E15-Event-File-Convention.md"
}

foreach ($file in $conventionsFiles) {
    if ($conventionsMapping.ContainsKey($file.Name)) {
        Rename-FileWithIndex -FilePath $file.FullName -NewName $conventionsMapping[$file.Name] -Reason "Convention concept"
    }
}

# ============================================================
# Save rename log
# ============================================================
$renameLog | ConvertTo-Json -Depth 3 | Out-File "$PWD\index-naming-log.json" -Encoding UTF8
Write-Host "`n=== Index-Derived Naming Complete ===" -ForegroundColor Green
Write-Host "Total files renamed: $($renameLog.Count)" -ForegroundColor Cyan
Write-Host "Log saved to index-naming-log.json" -ForegroundColor Cyan
