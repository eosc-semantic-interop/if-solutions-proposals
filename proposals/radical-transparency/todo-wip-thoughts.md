## TODO list

* complete the list of patterns
  * RT-P01: ✅ Profile Conformity Declarations (central conformance declarations)
  * RT-P02: ✅ Profile Composition (focused on recursive inference; versioning moved to #09)
  * RT-P03: ✅ Conneg Menu Provisioning (includes the rel="self" identity anchor for redirects)
  * RT-P04: ✅ No-Landing-Page Solution
  * RT-P05: Subsetting API Pattern
  * RT-P06: Host-wide Resource Discovery (New: Focused on mixing Linksets with Sitemaps/Signmaps)
  * RT-P07: Catalog Listings
  * RT-P08: Harvesting API
  * RT-P09: Version / Release Linking (Handling the timeline of both resources and profiles)
  * RT-P10: ✅ Offline (Detached) Copies (For filesystem/detached verification)
  * RT-P11: Large Linkset Splits (Paging and OGC-style large map handling)
  * RT-P12: API-UI & Aggregate Content Parts (Context of SPAs and JS-rendered content)
  * RT-P13: Web Manifests
* and some support docs
  * RT-D14: Mapping & RDF Uplifting (Guide on semantic equivalence across headers, HTML, and triples)
  * RT-D15: Profile Registry & Description Vision (Strategic vision for registries like cpurr)
  * RT-D16: RFC Anthology (New: A concise technical sketch of the foundational IETF standards involved)
  * RT-D00: Index & Reading Guide (The final navigation guide for the series)
* investigate and contact alignment requests to other org
  * ogc
  * cdif
  * signposting
  * ceds-dscc
  * odis
  * eosc
* provide design docs for tools and implementations:  possibly / strategically without mentioning the foreseen tools
  * docker-lsup-ref :: demo link-set-usage-pattern in practice for demonstrations, explanations, and tool-testing
  * wrx :: js library to get structural information at any URI (+bun cli)
  * cpurr :: github based listing of known / used profiles for reuse << profile registry
  * stitch :: browser plugin to visualise and interact with the "webmap" (rdf, patterns, ..)
  * grmp :: testing and monitoring conformance of available web resources
  * webmap-er :: visual editor for linkset files supporting "pattern weaving" + combining actual resource selection
    + supporting generative uri-pattern approaches
  * rdf-webcomponents :: js lib and approach for a LOD-first web produces UX affordances that decouple data providing from app consumption


## Older Related Thoughts

* keep an eye on the CDIF link in this initiative 
  * namely open issues [#14](https://github.com/Cross-Domain-Interoperability-Framework/cdifbook/issues/14) and [#15](https://github.com/Cross-Domain-Interoperability-Framework/cdifbook/issues/15)
* deepen how the [FIP work](https://fip.fair-wizard.com/wizard) can fit with this (both attempting to bring data- and evidence-driven techniques into the interop work)
  * FIP leads in this aspect already, and will sure remain relevant to cover the influx and coverage of the "non-automated" side of things
  * While this RT stuff could add (through automation) a broader coverage
* eye open on recent dataspace / w3c efforts
  * [w3c dataspaces cg](https://w3c-cg.github.io/dataspaces/)
  * [SDS26](https://dbis.rwth-aachen.de/SDS26/)

