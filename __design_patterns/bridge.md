# Bridge

## Tl;dr

Bridge pattern is about preferring **composition over inheritance**.
Implementation details are pushed from a hierarchy to another object with a separate hierarchy.

Wikipedia says

The bridge pattern is a design pattern used in software engineering that is meant
to "decouple an abstraction from its implementation so that the two can vary independently".

## Resources

- https://github.com/kamranahmedse/design-patterns-for-humans

## When to use - What it solves

## Example

```java
$darkTheme = new DarkTheme();

$about = new About($darkTheme);
$careers = new Careers($darkTheme);

echo $about->getContent(); // "About page in Dark Black";
echo $careers->getContent(); // "Careers page in Dark Black";
```