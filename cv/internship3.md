---
layout: page
title: Development and Validation of Physics Modules for the New Reionization Simulation Code Dyablo
description: >
    Internship made during my third year as an engineering student at Télécom Physique Strasbourg. Study done using the Dyablo simulation code to validate structure formation and improve reionization modeling.
hide_description: false
sitemap: false
---


### Abstract :

Modern astrophysics increasingly relies on numerical simulations to test theoretical models and visualize complex processes without the need for expensive or time-consuming experimentation. In this context, the simulation code *Dyablo* plays a major role. It is a high-performance hydrodynamics code that models astrophysical fluids designed to study the Epoch of Reionization in supercomputing environments using adaptive mesh refinement grids.

Accurate modeling of structure formation and reionization is crucial to understand the early evolution of the Universe. This work has a focus on both of those aspects through *Dyablo*. The first is the validation of the structure formation module which has been coded but not yet validated. To assess its validity, the mass functions of known structure formation theoretical formalisms (Press-Schechter & Sheth-Tormen) will be compared to outputs of *Dyablo*. A second part of this work aims at improving the reionization module using the results from the previous part. Indeed, the validation of the formation of structures allows to confidently use theoretical frameworks to model unresolved phenomena like the formation of stars which emit photons and ionize the surrounding environment leading to a more accurate estimate of the number of photons produced.

This project has been successful : the validation confirmed the consistency of the structure formation module with theoretical expectations and we were able to use those results as a basis to improve reionization scenarios produced by *Dyablo*.  

**Keywords :** reionization, high performance computing, structure formation, numerical simulations.

<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.min.js"></script>

<script>
  document.getElementById('_pushState').addEventListener('hy-push-state-load', function() {
    const url = "/assets/pdf/ADS_MESQUITA_Samuel_Rapport_3A.pdf"; 
    const loadingTask = pdfjsLib.getDocument(url);
    loadingTask.promise.then(pdf => {
      pdf.getPage(1).then(page => {
        const scale = 1.5;
        const viewport = page.getViewport({ scale });
        const canvas = document.getElementById('pdf-canvas');
        if (!canvas) return; 
        const context = canvas.getContext('2d');
        canvas.height = viewport.height;
        canvas.width = viewport.width;
        const renderContext = {
          canvasContext: context,
          viewport: viewport
        };
        page.render(renderContext);
      });
    });
  });
</script> "