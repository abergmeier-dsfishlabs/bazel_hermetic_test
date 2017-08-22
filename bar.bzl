
def _bar_impl(ctx):
    ctx.action(
        outputs = [ctx.outputs.out],
        inputs = ctx.files._foo_bin,
        executable = ctx.executable._foo_bin,
    )


bar = rule(
    implementation = _bar_impl,
    attrs = {
        "_foo_bin": attr.label(default = Label("//:foo"), executable = True, cfg = "host"),
    },
    outputs = {
        "out": "%{name}.dummy",
    },
)
