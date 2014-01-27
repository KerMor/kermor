MathJax.Hub.Config({
  TeX: {
    Macros: {
      K: "\\mathcal{K}",
	  R: "\\mathbb{R}",
	  N: "\\mathbb{N}",
	  Z: "\\mathbb{Z}",
	  Q: "\\mathbb{Q}",
	  H: "\\mathcal{H}",
	  O: ["\\ensuremath{\\mathcal{O}\\left(#1\\right)}",1],
	  norm: ["\\left\\|#1\\right\\|_{#2}",2],
	  noG: ["\norm{#1}{G}",1],
	  no: ["\norm{#1}{}",1],
	  sp: ["\\left\\langle #1,#2 \\right\\rangle",2],
	  spG: ["\\sp{#1}{#2}_G",2],
	  vec: ["\\boldsymbol{#1}",1],
	  vG: "\\vec{G}",
	  vP: "\\vec{P}",
	  vR: "\\vec{R}",
	  vmu: "\\vec{\\mu}",
	  vx: "\\vec{x}",
	  vy: "\\vec{y}",
	  suml: ["\\sum\\limits_{#1}^{#2}",2],
	  sumi: "\\suml{i=1}{N}"
    }
  }
});
