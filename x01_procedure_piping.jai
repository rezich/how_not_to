// Let's say you have two simple procedures that look something like this:
a :: (b := false) -> float, string {
    f := ifx b then 1.1 else 2.2;
    s := "fartwaft";
    return f, s;
}

b :: (f: float, s: string) -> bool {
    return f == 1.1;
}

// You might want to pass multiple return values from a to b, given that the
// return value signature of the former matches the paramater signature of the
// latter, because that seems like a thing you might want to do sometimes,
// right?

main :: () {

    // Well, the most immediately obvious thing doesn't work:
    #if false {
        x := b(a());
    }
    // You cannot pass multiple return values in this fashion in this language.

    // This, however, does work:
    f, s := a();
    x := b(f, s);
    // It seems "uglier" because you can't do it all on one line and have to
    // declare intermediate variables. But really, it's not so bad.

    // This *could* work if the language design permitted "functional
    // programmery" things like procedure piping, which it totally could, but
    // chooses not to, at least for now:
    // x := a |> b;
    // x := a(true) |> b;

}

// So what is the rationale behind this langauge design decision?

/*

"My view on this is, it is the most common request from people coming from other
languages, who want this language to be like those other languages. But if this
language is the same as those other languages, there is no point in using this
language, first of all.

Part of what we are trying to do here is re-target the complexity budget, that
has been spent in relatively inefficient places in some of these other language
designs, so that it is spent in more efficient places here. That means we
implement features that really matter and really do things.

Chaining function calls or whatever is a stylistic element that is actually an
anti-pattern because it only makes sense when data structures own functions,
which is totally not the paradigm we are doing here, for many reasons."

— jblow, Secret Beta Discord, #general, 2020/11/05
https://discord.com/channels/661732390355337246/661732390355337249/773955799609245706

*/
