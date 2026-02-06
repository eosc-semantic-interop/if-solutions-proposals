## Plan towards adoption

This is a basic first stab at this. More work is ahead of us:

* agree and finetune on the core approach
* fine tune details, possibly through giving some practical examples (and thus attempted profiling of various things to consider: file-formats, web-services, catalogs, change-feeds, catalog-services, …)

Next we should surely also make stuff and dare to delve into implementation

* a python implementation of the discovery/harvest strategy as a reference implementation
* and translate it the other way around: turn that procedure in a practical asset-publication guide
  * then follow up and try infect big implementations to align

Getting it into practical use will also require some basic administration work (possibly repeated on different levels in different projects, or even for some catalogues) as we need to 

* create formally published profiles
* create low level profile registries
* provide basic support for externally harvestable profile-declarations and how to apply them to digital assets
* including a simple federation / composition model

But probably, and most importantly, also spend time in advocating this uniformly by making noise in various networks.

## well-intended side-effects .. extra selling points

Here are some additional benefits that should come from this "Radical Transparency" efforts.

### Low entry and Maturity Model Approach

The fact that no new standards are required, just an agreement on how to apply and use the existing ones makes this a low cost action.

For individual implementations too, actually introducing this does not require technically advanced techniques 

* new or existing registry / catalogue implementations will see this as trivial
* self-publication on github or other repositories is easily available through minimal effort (which we can lower further through training, guides, examples and tools)

### Interoperability bootstrap.

Despite the already done efforts, much of the interoperability work to date can only show limited and strictly local success. 

This would serve as an actual first step low level achievement for any uniform / global interoperability.

Even if nothing else ever can be agreed upon:
* This at least shows at least initial (and distributed) interoperability can exist
* And at least creates a practical basis for going further and finding more agreement in more complex areas

### Data driven interoperability

Indeed. Public conformity declarations will allow us to finally start counting and measuring. Despite all well intentions or appeals to common sense the current approach to interoperability lives in a strict qualitative landscape. Nobody really knows the shape nor the size of the interoperability landscape. The past efforts show established demonstrators at best, lacking actual measurement they fail to claim an overall effect on the problem actually getting any smaller.

Harvesting conformity declarations across the landscape will allow us to detect and count what is out there, where and how often it is being used.

### Market / Competition Driven and Open Ended Interoperability

As an extension of this, alternatives can co-exist, adapt, and compete creating a de facto good enough interoperability by rightfully taking up their position in a market place of profiles - tailored to certain usage.

This allows for a de facto evolution that can grab opportunities without the need to wait for central authorities to declare any new norms (or fail at it) 

### Automated adaptation and orchestration

Finally, this allows also developing, exposing, and automatically applying profile-conversion software on the fly. 

## Meta 

### Origin context, hooks and triggers …
* this was lingering as background brain-noise through inspiration from different other initiatives: signposting, ODIS-arch, RO-Crates and worldfair-cdif
* this got actively triggered in March through private discussions (Mark Dietrich)
* this got somewhat included in the ongoing work of the EOSC Technical Interoperability Group (Diego Scardaci et al). Currently a bit sidetracked through lack of time, self imposing to land around Feb 2026
* this got solidified again in talks during this week namely EOSC Symposium (Simon Hodson, Barbara Magagna, Markus Stocker, Esteban González Guardia ) and the SAGE GA (Christian Briese, Raul Palma, Joan Maso)
* this aligns with internal work in VLIZ on a python library for dealing with semantics and knowledge graphs

### This relates to …

#### within SAGE / Green Deal Dataspace project to these efforts and tasks:

* standardisation
* data harmonisation
* catalogue implementation
* …

#### within EOSC-federation

* federation of catalogues
* standardisation
* technical and semantical interoperability

#### and broader …
* to the dataspaces overall interoperability
* to general web api convergence

### Disclaimer

There is very little original work in this.  This is in fact good news: as all composing elements already exist (and are in some cases already in use) taking this route does not require new standards. 

It does however require a broad commitment to align to at least this lowest level agreement.

It is noteworthy that this also shows the lack of a minimal normative or guiding governance. No “governing body” out there seems to exist that can introduce and even enforce the usage of these techniques to achieve this “low hanging fruit”.

The best we can hope for is that more and more of them (like individual data-spaces, or EOSC nodes) just start doing it at least within their own realms.

### Strategy and approach

The design and scope-governance relies on a number of ideas that all have a somewhat paradoxical ring to them:
1. Serving to enable interoperability by formally organising the lack thereof.
2. Looking to find the minimal agreement through (only) agreeing on how to disagree
3. Maximising value by doing as little as possible for as much as possible.

This is no coincidence. Deliberately this aims to do only one thing, and do it with as much as possible without any hidden costs and assumed dependencies. This is to maximise broad adoption.

Being able to agree on a mechanism to communicate possible mis-alignment allows all of us to consider “what if we’re wrong” scenarios.

In the broader field of pursuing interoperability there is a tendency to stress the huge potential gains. It feels oddly off focus to show any caution and combine that with a deliberate modest ambition of only marginally contributing. However making ‘the economics’ of this actually work relies on making this a so-called safe (no-regrets) decision. The lack of visible immediate return is to be compensated only by the fact that it gets an adoption across the board.  This requires us to have implementation as simple and low cost as possible. In particular, referring back to the various levels of adoption suggested here, this should make clear only LVL0 is the core we are targeting here. Any higher levels are there to show further potential, not to increase cost of adoption.

### Ifs and buts …

Trying to address attempts to reason and motivate not to be ’radical transparent’

#### "Our domain dwells in personal data that cannot be shared just like that."

This is not about anyone exposing / opening / sharing anything they should not be exposing. Radical transparency does not deal with “what” you should be sharing, just with “how” you are doing it. If you can’t share, then don’t. But, if you do, declare how it is done, do not assume the audience can or should know about those details upfront.



