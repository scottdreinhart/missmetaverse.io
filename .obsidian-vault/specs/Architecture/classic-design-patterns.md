---
slug: classic-design-patterns
sources:
  - https://refactoring.guru/design-patterns/catalog
  - https://github.com/faif/typescript-patterns
  - https://www.typescriptbooks.cn/enums-and-design-patterns.html
date: 2026-11-02
tags:
  - design-patterns
  - creational
  - structural
  - behavioral
  - factory
  - singleton
  - strategy
  - observer
  - command
  - state
  - adapter
  - facade
  - decorator
  - composite
  - proxy
  - bridge
  - flyweight
  - chain-of-responsibility
  - mediator
  - iterator
  - template-method
  - visitor
  - memento
  - interpreter
---

# Classic Software Design Patterns

## Overview

Design patterns are **tools for particular problems, not a checklist requiring implementation of every pattern**. They are categorized into three groups: Creational, Structural, and Behavioral.

---

## 1. Creational Patterns

### Factory Method

**Define an interface for creating an object, but let subclasses decide which class to instantiate.**

```typescript
// ❌ Without Factory Method
class MessageService {
  send(message: Message): void {
    if (message.type === 'email') {
      const email = new EmailService()
      email.send(message.content)
    } else if (message.type === 'sms') {
      const sms = new SmsService()
      sms.send(message.content)
    } else if (message.type === 'push') {
      const push = new PushService()
      push.send(message.content)
    }
  }
}

// ✅ With Factory Method
interface NotificationService {
  send(content: string): void
}

class EmailService implements NotificationService {
  send(content: string): void {
    console.log(`Sending email: ${content}`)
  }
}

class SmsService implements NotificationService {
  send(content: string): void {
    console.log(`Sending SMS: ${content}`)
  }
}

class PushService implements NotificationService {
  send(content: string): void {
    console.log(`Sending push notification: ${content}`)
  }
}

class NotificationFactory {
  static create(type: 'email' | 'sms' | 'push'): NotificationService {
    switch (type) {
      case 'email': return new EmailService()
      case 'sms': return new SmsService()
      case 'push': return new PushService()
    }
  }
}

// Usage — no conditional logic in client code
const service = NotificationFactory.create('email')
service.send('Hello!')
```

### Abstract Factory

**Provide an interface for creating families of related or dependent objects without specifying their concrete classes.**

```typescript
interface Button { render(): void }
interface Checkbox { render(): void }
interface Input { render(): void }

interface UIFactory {
  createButton(): Button
  createCheckbox(): Checkbox
  createInput(): Input
}

// Windows UI
class WindowsButton implements Button { render() { console.log('Windows button') } }
class WindowsCheckbox implements Checkbox { render() { console.log('Windows checkbox') } }
class WindowsInput implements Input { render() { console.log('Windows input') } }

class WindowsFactory implements UIFactory {
  createButton() { return new WindowsButton() }
  createCheckbox() { return new WindowsCheckbox() }
  createInput() { return new WindowsInput() }
}

// macOS UI
class MacButton implements Button { render() { console.log('Mac button') } }
class MacCheckbox implements Checkbox { render() { console.log('Mac checkbox') } }
class MacInput implements Input { render() { console.log('Mac input') } }

class MacFactory implements UIFactory {
  createButton() { return new MacButton() }
  createCheckbox() { return new MacCheckbox() }
  createInput() { return new MacInput() }
}

// Usage
const factory = new WindowsFactory()
const button = factory.createButton()
button.render()
```

### Builder

**Separate construction of a complex object from its representation.**

```typescript
class HttpRequestBuilder {
  private url = ''
  private method = 'GET'
  private headers: Record<string, string> = {}
  private body?: string

  setUrl(url: string): HttpRequestBuilder {
    this.url = url
    return this
  }

  setMethod(method: 'GET' | 'POST' | 'PUT' | 'DELETE'): HttpRequestBuilder {
    this.method = method
    return this
  }

  setHeader(key: string, value: string): HttpRequestBuilder {
    this.headers[key] = value
    return this
  }

  setBody(body: string): HttpRequestBuilder {
    this.body = body
    return this
  }

  build(): HttpRequest {
    return { url: this.url, method: this.method, headers: this.headers, body: this.body }
  }
}

// Usage
const request = new HttpRequestBuilder()
  .setUrl('https://api.example.com/users')
  .setMethod('POST')
  .setHeader('Content-Type', 'application/json')
  .setBody(JSON.stringify({ name: 'John' }))
  .build()
```

### Prototype

**Create new objects by copying an existing instance.**

```typescript
class Product implements Cloneable<Product> {
  constructor(
    public id: string,
    public name: string,
    public price: number,
    public tags: string[]
  ) {}

  clone(): Product {
    return new Product(this.id, this.name, this.price, [...this.tags])
  }
}

// Usage — create a variant without recreating from scratch
const original = new Product('1', 'Basic Plan', 9.99, ['basic', 'monthly'])
const premium = original.clone()
premium.id = '2'
premium.name = 'Premium Plan'
premium.price = 29.99
premium.tags.push('premium', 'priority-support')
```

### Singleton

**Ensure a class has only one instance and provide global access to it.**

```typescript
class Logger {
  private static instance: Logger | null = null
  private logs: string[] = []

  private constructor() {}

  static getInstance(): Logger {
    if (!Logger.instance) {
      Logger.instance = new Logger()
    }
    return Logger.instance
  }

  log(message: string): void {
    this.logs.push(`${new Date().toISOString()} - ${message}`)
    console.log(message)
  }

  getLogs(): string[] {
    return [...this.logs]
  }
}

// Usage
const logger = Logger.getInstance()
logger.log('Application started')
```

> **Note**: Singletons can make testing harder. Consider dependency injection for better testability.

---

## 2. Structural Patterns

### Adapter

**Convert the interface of a class into another interface clients expect.**

```typescript
// Existing API (cannot be changed)
interface LegacyPaymentGateway {
  processPayment(amount: number, currency: string): boolean
}

class StripeAdapter implements LegacyPaymentGateway {
  async processPayment(amount: number, currency: string): Promise<boolean> {
    // Convert modern API to legacy interface
    const stripe = new StripeClient()
    try {
      await stripe.charges.create({ amount, currency })
      return true
    } catch {
      return false
    }
  }
}

// Usage — client uses the legacy interface
function checkout(gateway: LegacyPaymentGateway, amount: number): boolean {
  return gateway.processPayment(amount, 'USD')
}
```

### Facade

**Provide a simplified interface to a library, API, or set of classes.**

```typescript
class VideoProcessingService {
  async convert(file: string, format: string): Promise<void> { /* ... */ }
  async compress(file: string): Promise<void> { /* ... */ }
  async extractAudio(file: string): Promise<void> { /* ... */ }
  async addWatermark(file: string, watermark: string): Promise<void> { /* ... */ }
}

class VideoServiceFacade {
  constructor(private processor: VideoProcessingService) {}

  // Simplified interface for common use case
  async processVideo(file: string, outputFormat: string): Promise<string> {
    const processed = `${file}_processed.${outputFormat}`

    await this.processor.compress(file)
    await this.processor.convert(file, outputFormat)
    await this.processor.addWatermark(processed, 'watermark.png')

    return processed
  }
}

// Usage — client doesn't need to know about individual steps
const facade = new VideoServiceFacade(new VideoProcessingService())
const result = await facade.processVideo('video.mp4', 'webm')
```

### Decorator

**Add behavior to objects without modifying their class.**

```typescript
interface Coffee {
  cost(): number
  description(): string
}

class SimpleCoffee implements Coffee {
  cost() { return 5 }
  description() { return 'Simple Coffee' }
}

class MilkDecorator implements Coffee {
  constructor(private coffee: Coffee) {}
  cost() { return this.coffee.cost() + 2 }
  description() { return this.coffee.description() + ', Milk' }
}

class SugarDecorator implements Coffee {
  constructor(private coffee: Coffee) {}
  cost() { return this.coffee.cost() + 1 }
  description() { return this.coffee.description() + ', Sugar' }
}

// Usage
let coffee: Coffee = new SimpleCoffee()
coffee = new MilkDecorator(coffee)
coffee = new SugarDecorator(coffee)

console.log(coffee.cost())       // 8
console.log(coffee.description()) // "Simple Coffee, Milk, Sugar"
```

### Composite

**Compose objects into tree structures to represent part-whole hierarchies.**

```typescript
interface Component {
  operation(): number
}

class Leaf implements Component {
  constructor(private value: number) {}
  operation(): number { return this.value }
}

class Composite implements Component {
  private children: Component[] = []

  add(child: Component): void {
    this.children.push(child)
  }

  operation(): number {
    return this.children.reduce((sum, child) => sum + child.operation(), 0)
  }
}

// Usage — treat individual objects and compositions uniformly
const tree = new Composite()
tree.add(new Leaf(1))
tree.add(new Leaf(2))

const subTree = new Composite()
subTree.add(new Leaf(3))
subTree.add(new Leaf(4))
tree.add(subTree)

console.log(tree.operation()) // 10
```

### Proxy

**Provide a surrogate or placeholder for another object to control access.**

```typescript
interface Image { display(): void }

class RealImage implements Image {
  constructor(private filename: string) {
    this.loadFromDisk(filename) // Expensive operation
  }

  private loadFromDisk(filename: string): void {
    console.log(`Loading ${filename} from disk...`)
  }

  display(): void {
    console.log(`Displaying ${this.filename}`)
  }
}

class ImageProxy implements Image {
  private realImage: RealImage | null = null

  constructor(private filename: string) {}

  display(): void {
    if (!this.realImage) {
      this.realImage = new RealImage(this.filename)
    }
    this.realImage.display()
  }
}

// Usage — loading is deferred until first display
const proxy = new ImageProxy('large-image.jpg')
// No loading yet
proxy.display() // Loading happens here
proxy.display() // Already loaded, just displays
```

### Bridge

**Decouple an abstraction from its implementation so they can vary independently.**

```typescript
interface Color { apply(): string }
class Red implements Color { apply() { return 'red' } }
class Blue implements Color { apply() { return 'blue' } }
class Green implements Color { apply() { return 'green' } }

interface Shape { render(color: Color): void }

class Circle implements Shape {
  render(color: Color): void {
    console.log(`Circle in ${color.apply()}`)
  }
}

class Square implements Shape {
  render(color: Color): void {
    console.log(`Square in ${color.apply()}`)
  }
}

// Usage — shapes and colors vary independently
const shapes: Shape[] = [new Circle(), new Square()]
const colors: Color[] = [new Red(), new Blue(), new Green()]

for (const shape of shapes) {
  for (const color of colors) {
    shape.render(color)
  }
}
```

### Flyweight

**Share common state between objects to support large numbers of fine-grained objects.**

```typescript
class TreeType {
  constructor(
    private name: string,
    private color: string,
    private trunkColor: string
  ) {}

  display(x: number, y: number): void {
    console.log(`Tree at (${x}, ${y}): ${this.name} (${this.color})`)
  }
}

class TreeFactory {
  private static trees: Map<string, TreeType> = new Map()

  static getTreeType(name: string, color: string, trunkColor: string): TreeType {
    const key = `${name}-${color}-${trunkColor}`
    if (!this.trees.has(key)) {
      this.trees.set(key, new TreeType(name, color, trunkColor))
    }
    return this.trees.get(key)!
  }
}

// Usage — share tree types across many tree instances
class Forest {
  private trees: { x: number; y: number; type: TreeType }[] = []

  plantTree(x: number, y: number, type: TreeType): void {
    this.trees.push({ x, y, type })
  }

  render(): void {
    for (const tree of this.trees) {
      tree.type.display(tree.x, tree.y)
    }
  }
}
```

---

## 3. Behavioral Patterns

### Strategy

**Define a family of algorithms, put each in a separate class, and make them interchangeable.**

```typescript
interface SortStrategy {
  sort(data: number[]): number[]
}

class QuickSort implements SortStrategy {
  sort(data: number[]): number[] {
    // Quick sort implementation
    if (data.length <= 1) return data
    const pivot = data[Math.floor(data.length / 2)]
    const left = data.filter(x => x < pivot)
    const right = data.filter(x => x >= pivot)
    return [...this.sort(left), pivot, ...this.sort(right)]
  }
}

class MergeSort implements SortStrategy {
  sort(data: number[]): number[] {
    // Merge sort implementation
    if (data.length <= 1) return data
    const mid = Math.floor(data.length / 2)
    return this.merge(this.sort(data.slice(0, mid)), this.sort(data.slice(mid)))
  }

  private merge(left: number[], right: number[]): number[] {
    const result: number[] = []
    let i = 0, j = 0
    while (i < left.length && j < right.length) {
      if (left[i] <= right[j]) result.push(left[i++])
      else result.push(right[j++])
    }
    return [...result, ...left.slice(i), ...right.slice(j)]
  }
}

class Sorter {
  constructor(private strategy: SortStrategy) {}

  setStrategy(strategy: SortStrategy): void {
    this.strategy = strategy
  }

  sort(data: number[]): number[] {
    return this.strategy.sort(data)
  }
}

// Usage — strategy can change at runtime
const sorter = new Sorter(new QuickSort())
console.log(sorter.sort([3, 1, 4, 1, 5, 9, 2, 6]))

sorter.setStrategy(new MergeSort())
console.log(sorter.sort([3, 1, 4, 1, 5, 9, 2, 6]))
```

### Observer

**Define a one-to-many dependency so that when one object changes state, all its dependents are notified.**

```typescript
type Listener = (data: unknown) => void

class EventEmitter {
  private listeners = new Map<string, Set<Listener>>()

  on(event: string, listener: Listener): void {
    if (!this.listeners.has(event)) {
      this.listeners.set(event, new Set())
    }
    this.listeners.get(event)!.add(listener)
  }

  off(event: string, listener: Listener): void {
    this.listeners.get(event)?.delete(listener)
  }

  emit(event: string, data?: unknown): void {
    this.listeners.get(event)?.forEach(listener => listener(data))
  }
}

// Usage
const emitter = new EventEmitter()

emitter.on('user:login', (user) => {
  console.log(`User ${user} logged in`)
})

emitter.on('user:login', (user) => {
  console.log(`Sending welcome email to ${user}`)
})

emitter.emit('user:login', 'john@example.com')
// Output:
// User john@example.com logged in
// Sending welcome email to john@example.com
```

### Command

**Encapsulate a request as an object, allowing parameterization and queuing of requests.**

```typescript
interface Command {
  execute(): void
  undo(): void
}

class Light {
  turnOn(): void { console.log('Light ON') }
  turnOff(): void { console.log('Light OFF') }
}

class TurnOnCommand implements Command {
  constructor(private light: Light) {}
  execute() { this.light.turnOn() }
  undo() { this.light.turnOff() }
}

class TurnOffCommand implements Command {
  constructor(private light: Light) {}
  execute() { this.light.turnOff() }
  undo() { this.light.turnOn() }
}

class RemoteControl {
  private commands: Map<number, Command> = new Map()
  private history: Command[] = []

  setCommand(slot: number, command: Command): void {
    this.commands.set(slot, command)
  }

  pressButton(slot: number): void {
    const command = this.commands.get(slot)
    if (command) {
      command.execute()
      this.history.push(command)
    }
  }

  undoLast(): void {
    const command = this.history.pop()
    command?.undo()
  }
}

// Usage
const light = new Light()
const remote = new RemoteControl()

remote.setCommand(1, new TurnOnCommand(light))
remote.setCommand(2, new TurnOffCommand(light))

remote.pressButton(1) // Light ON
remote.pressButton(2) // Light OFF
remote.undoLast()     // Light ON (undo)
```

### State

**Allow an object to alter its behavior when its internal state changes.**

```typescript
interface OrderState {
  name: string
  confirm(): void
  cancel(): void
  ship(): void
}

class PendingState implements OrderState {
  readonly name = 'PENDING'
  confirm() { console.log('Order confirmed') }
  cancel() { console.log('Order cancelled') }
  ship() { throw new Error('Cannot ship a pending order') }
}

class ConfirmedState implements OrderState {
  readonly name = 'CONFIRMED'
  confirm() { throw new Error('Order already confirmed') }
  cancel() { console.log('Order cancelled') }
  ship() { console.log('Order shipped') }
}

class ShippedState implements OrderState {
  readonly name = 'SHIPPED'
  confirm() { throw new Error('Order already confirmed') }
  cancel() { throw new Error('Cannot cancel a shipped order') }
  ship() { throw new Error('Order already shipped') }
}

class Order {
  private state: OrderState = new PendingState()

  confirm() { this.state.confirm() }
  cancel() { this.state.cancel() }
  ship() { this.state.ship() }

  getState(): string { return this.state.name }

  // State transitions
  private transition(newState: OrderState): void {
    this.state = newState
  }
}

// Usage
const order = new Order()
console.log(order.getState()) // PENDING
order.confirm()               // Order confirmed
order.ship()                  // Order shipped
```

### Chain of Responsibility

**Pass a request along a chain of handlers.**

```typescript
type Handler = (request: string) => boolean | void

class Logger {
  constructor(
    private level: string,
    private next: Handler | null = null
  ) {}

  handle(request: string): boolean {
    if (this.shouldHandle(request)) {
      console.log(`[${this.level}] ${request}`)
      return true
    }
    return this.next?.handle(request) ?? false
  }

  private shouldHandle(request: string): boolean {
    return request.startsWith(this.level)
  }
}

// Build chain
const debug = new Logger('DEBUG')
const info = new Logger('INFO', debug)
const error = new Logger('ERROR', info)

// Usage — request flows through chain
error.handle('ERROR: Database connection failed')
// Output: [ERROR] Database connection failed

info.handle('INFO: User logged in')
// Output: [INFO] User logged in

debug.handle('DEBUG: Cache miss')
// Output: [DEBUG] Cache miss
```

### Mediator

**Define an object that encapsulates how a set of objects interact.**

```typescript
class ChatMediator {
  private users: User[] = []

  addUser(user: User): void {
    this.users.push(user)
  }

  sendMessage(sender: User, message: string): void {
    for (const user of this.users) {
      if (user !== sender) {
        user.receive(message)
      }
    }
  }
}

class User {
  private name: string
  private mediator: ChatMediator

  constructor(name: string, mediator: ChatMediator) {
    this.name = name
    this.mediator = mediator
    mediator.addUser(this)
  }

  send(message: string): void {
    console.log(`${this.name} sends: ${message}`)
    this.mediator.sendMessage(this, message)
  }

  receive(message: string): void {
    console.log(`${this.name} receives: ${message}`)
  }
}

// Usage
const mediator = new ChatMediator()
const alice = new User('Alice', mediator)
const bob = new User('Bob', mediator)

alice.send('Hello!')
// Output:
// Alice sends: Hello!
// Bob receives: Hello!
```

### Iterator

**Provide a way to access elements sequentially without exposing the underlying collection.**

```typescript
interface Iterator<T> {
  next(): { value: T; done: boolean }
  hasNext(): boolean
}

class UserCollection {
  private users: string[] = ['Alice', 'Bob', 'Charlie', 'Diana']

  createIterator(): Iterator<string> {
    let index = 0
    return {
      next(): { value: string; done: boolean } {
        if (index < this.users.length) {
          return { value: this.users[index++], done: false }
        }
        return { value: null as any, done: true }
      },
      hasNext(): boolean {
        return index < this.users.length
      }
    }
  }
}

// Usage — iterate without exposing internal structure
const collection = new UserCollection()
const iterator = collection.createIterator()

while (iterator.hasNext()) {
  console.log(iterator.next().value)
}
```

### Template Method

**Define the skeleton of an algorithm in a base class, letting subclasses override steps.**

```typescript
abstract class ReportGenerator {
  generate(): string {
    return [
      this.getHeader(),
      this.getBody(),
      this.getFooter(),
    ].join('\n')
  }

  protected getHeader(): string {
    return '=== Report ==='
  }

  protected abstract getBody(): string

  protected getFooter(): string {
    return `Generated: ${new Date().toISOString()}`
  }
}

class SalesReport extends ReportGenerator {
  protected getBody(): string {
    return 'Sales: $100,000\nProfit: $25,000'
  }
}

class UserReport extends ReportGenerator {
  protected getBody(): string {
    return 'Users: 5,000\nActive: 3,200'
  }
}

// Usage
const sales = new SalesReport()
console.log(sales.generate())
// === Report ===
// Sales: $100,000
// Profit: $25,000
// Generated: 2026-11-02T...

const users = new UserReport()
console.log(users.generate())
// === Report ===
// Users: 5,000
// Active: 3,200
// Generated: 2026-11-02T...
```

### Visitor

**Represent an operation to be performed on elements of an object structure without changing their classes.**

```typescript
interface Element { accept(visitor: Visitor): void }

class Circle implements Element {
  constructor(public radius: number) {}
  accept(visitor: Visitor): void { visitor.visitCircle(this) }
}

class Square implements Element {
  constructor(public side: number) {}
  accept(visitor: Visitor): void { visitor.visitSquare(this) }
}

interface Visitor {
  visitCircle(circle: Circle): void
  visitSquare(square: Square): void
}

class AreaCalculator implements Visitor {
  visitCircle(circle: Circle): void {
    console.log(`Circle area: ${(Math.PI * circle.radius ** 2).toFixed(2)}`)
  }
  visitSquare(square: Square): void {
    console.log(`Square area: ${(square.side ** 2).toFixed(2)}`)
  }
}

class PerimeterCalculator implements Visitor {
  visitCircle(circle: Circle): void {
    console.log(`Circle perimeter: ${(2 * Math.PI * circle.radius).toFixed(2)}`)
  }
  visitSquare(square: Square): void {
    console.log(`Square perimeter: ${(4 * square.side).toFixed(2)}`)
  }
}

// Usage
const shapes: Element[] = [new Circle(5), new Square(4)]
const areaCalc = new AreaCalculator()
const perimeterCalc = new PerimeterCalculator()

for (const shape of shapes) {
  shape.accept(areaCalc)
  shape.accept(perimeterCalc)
}
```

### Memento

**Capture and externalize an object's internal state without violating encapsulation.**

```typescript
class EditorMemento {
  constructor(private content: string, private cursorPos: number) {}

  getContent(): string { return this.content }
  getCursorPos(): number { return this.cursorPos }
}

class TextEditor {
  private content: string = ''
  private cursorPos: number = 0

  setContent(content: string): void {
    this.content = content
  }

  setCursor(pos: number): void {
    this.cursorPos = pos
  }

  save(): EditorMemento {
    return new EditorMemento(this.content, this.cursorPos)
  }

  restore(memento: EditorMemento): void {
    this.content = memento.getContent()
    this.cursorPos = memento.getCursorPos()
  }

  getState(): string {
    return `Content: "${this.content}", Cursor: ${this.cursorPos}`
  }
}

class History {
  private states: EditorMemento[] = []

  save(state: EditorMemento): void {
    this.states.push(state)
  }

  undo(): EditorMemento | null {
    return this.states.pop() ?? null
  }
}

// Usage
const editor = new TextEditor()
const history = new History()

editor.setContent('Hello')
history.save(editor.save())

editor.setContent('Hello World')
editor.restore(history.undo()!)
// Content reverts to "Hello"
```

---

## 4. Pattern Summary

| Category | Pattern | Use When |
|----------|---------|----------|
| **Creational** | Factory Method | Subclasses decide instantiation |
| **Creational** | Abstract Factory | Families of related objects |
| **Creational** | Builder | Complex object construction |
| **Creational** | Prototype | Copy existing objects |
| **Creational** | Singleton | Single instance needed |
| **Structural** | Adapter | Incompatible interfaces |
| **Structural** | Facade | Simplify complex API |
| **Structural** | Decorator | Add behavior dynamically |
| **Structural** | Composite | Part-whole hierarchies |
| **Structural** | Proxy | Control access / lazy loading |
| **Structural** | Bridge | Decouple abstraction from implementation |
| **Structural** | Flyweight | Share state across many objects |
| **Behavioral** | Strategy | Swap algorithms at runtime |
| **Behavioral** | Observer | Notify dependents on state change |
| **Behavioral** | Command | Encapsulate requests / undo |
| **Behavioral** | State | Behavior changes with state |
| **Behavioral** | Chain of Responsibility | Multiple handlers for a request |
| **Behavioral** | Mediator | Many objects interact tightly |
| **Behavioral** | Iterator | Sequential access without exposing structure |
| **Behavioral** | Template Method | Algorithm skeleton with customizable steps |
| **Behavioral** | Visitor | New operations on stable object structure |
| **Behavioral** | Memento | Save/restore state without breaking encapsulation |

---

## Cross-References

- [Clean Architecture](./clean-architecture.md)
- [SOLID Principles](./solid-principles.md)
- [DDD Patterns](./ddd-patterns.md)
- [Atomic Design](./atomic-design.md)
- [Architecture Patterns](./architecture-patterns.md)
- [Coding Practices](./coding-practices.md)
