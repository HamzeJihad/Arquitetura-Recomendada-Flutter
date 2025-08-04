# Projeto TODO App em Flutter com Arquitetura Recomendada

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?style=for-the-badge&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-blue?style=for-the-badge&logo=dart)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

## 🎯 Sobre o Projeto

Este é um projeto de exemplo de um aplicativo de lista de tarefas (TODO) desenvolvido em Flutter. O principal objetivo não é apenas criar um aplicativo funcional, mas sim **demonstrar e aplicar as melhores práticas e uma arquitetura de software robusta, escalável e de fácil manutenção**.

Este projeto serve como um guia prático para desenvolvedores Flutter que desejam estruturar suas aplicações de forma profissional, seguindo os padrões recomendados pela comunidade.

---

## 🏛️ Arquitetura Aplicada

A arquitetura deste projeto é uma combinação dos princípios da **Clean Architecture** com o padrão **MVVM (Model-View-ViewModel)**. Essa abordagem visa uma clara separação de responsabilidades, facilitando os testes, a reutilização de código e a evolução do projeto.


A aplicação é dividida em três camadas principais:

### 1. Camada de Dados (Data Layer)

- **Responsabilidade:** Buscar e armazenar dados. Ela não se preocupa com regras de negócio.
- **Componentes:**
    - **Datasources:** Fontes de dados concretas. Podem ser uma API remota (ex: Firebase, API REST) ou um banco de dados local (ex: `shared_preferences`, `sqflite`).
    - **Models:** Representações dos dados brutos, exatamente como vêm da fonte de dados. Ex: `TodoModel`.
    - **Repositories (Implementação):** Implementações concretas dos contratos (interfaces) definidos na camada de Domínio. É aqui que decidimos se vamos buscar os dados de uma API ou de um cache local, por exemplo.

### 2. Camada de Domínio (Domain Layer)

- **Responsabilidade:** Conter a lógica de negócio da aplicação (as regras). Esta é a camada mais importante e independente do projeto. Ela não conhece Flutter, nem como os dados são armazenados.
- **Componentes:**
    - **Entities:** Objetos de negócio puros. Representam os conceitos centrais da aplicação.
    - **Repositories (Abstração/Contrato):** Interfaces que definem as "regras" para obter os dados. Por exemplo, `abstract class TodoRepository { Future<List<Todo>> getTodos(); }`. A implementação real fica na camada de Dados.
    - **Usecases (ou Interactors):** Classes que orquestram uma única funcionalidade ou regra de negócio. Ex: `GetTodosUsecase`, `AddTodoUsecase`.

### 3. Camada de Apresentação (Presentation Layer)

- **Responsabilidade:** Exibir a interface do usuário (UI) e capturar as interações do usuário. É a única camada que utiliza o SDK do Flutter.
- **Padrão Utilizado: MVVM (Model-View-ViewModel)**
    - **View (Páginas/Widgets):** A UI, escrita de forma declarativa e "burra". Sua única responsabilidade é renderizar o estado fornecido pelo ViewModel e notificar o ViewModel sobre eventos do usuário (ex: clique de um botão).
    - **ViewModel:** O cérebro da View. Contém toda a lógica de apresentação, gerencia o estado da tela e se comunica com a camada de Domínio através dos `Usecases`. O ViewModel não tem nenhuma importação de `dart:ui` ou `material.dart`.
    - **Model:** Neste contexto, refere-se ao estado da UI que o ViewModel expõe para a View.

---

## ✨ Conceitos Adicionais

Para conectar essas camadas de forma eficiente, utilizamos dois conceitos fundamentais:

- **Gerenciamento de Estado (State Management):** Utilizamos o pacote `provider` para expor o `ViewModel` para a `View`. O `ChangeNotifier` (parte do SDK do Flutter) é usado dentro do ViewModel para notificar a View sobre mudanças de estado, fazendo com que a UI seja reconstruída de forma reativa.

- **Injeção de Dependências (Dependency Injection - DI):** Para desacoplar as camadas, usamos o pacote `get_it` como um Service Locator. Ele nos permite registrar nossas dependências (como Repositories e UseCases) em um local central e acessá-las de qualquer parte do app sem a necessidade de acoplamento direto.

---
