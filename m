Received: from mail.maslowski.xyz (mail.maslowski.xyz [45.77.158.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2589A32196
	for <asahi@lists.linux.dev>; Tue, 10 Oct 2023 20:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=maslowski.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maslowski.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maslowski.xyz header.i=@maslowski.xyz header.b="DwpTxLW5"
Received: from localhost (ett70.neoplus.adsl.tpnet.pl [83.20.165.70])
	by mail.maslowski.xyz (Postfix) with ESMTPSA id 1E96B7DCB4;
	Tue, 10 Oct 2023 20:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=maslowski.xyz;
	s=mail; t=1696968100;
	bh=/2gwZ739v8DpOVOtm9Lfo12Y+plihVmCwN30N+COQwc=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=DwpTxLW5btzuMHmOnoHSnjGmPnG1rwapamgU6sPVq0sFhaletv8M92XrKhlZC6lRe
	 wQOOBCVr2QzFskXK0cUjE6YhysoUOyKKVY7PUhQ5i7wGNM9Ij6Q5XDJI+aXugEdGVb
	 7AsLS2DUac9YGzeOhEVnkE4upPG5QR60fVievIR7QkQ6BfTQ/YG/bdYwA6rMea4g2k
	 /fF99sINPT2WcpG4JlcAMs2ClDjqMf+OOKFItqaGB8qeGbyTpj6wmme+CqleMIfRHi
	 t2FqqDx8K5sSxgi+hMhzMGlabvhfU/EpogNy1ZS7V2K9yhKNgDV4ou5I/37JGf6Y1z
	 8nzdiGeCkZJYQ==
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Oct 2023 22:01:33 +0200
To: "Caleb Connolly" <caleb.connolly@linaro.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Sam Ravnborg" <sam@ravnborg.org>, "David
 Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, "Rob
 Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Thierry Reding" <thierry.reding@gmail.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>
Cc: "Robert Mader" <robert.mader@posteo.de>, "Guido Gunther"
 <agx@sigxcpu.org>, <dri-devel@lists.freedesktop.org>, "Hector Martin"
 <marcan@marcan.st>, <devicetree@vger.kernel.org>,
 <phone-devel@vger.kernel.org>, <asahi@lists.linux.dev>,
 <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH RFC] dt-bindings: display: document display panel
 occlusions
From: =?utf-8?q?Piotr_Mas=C5=82owski?= <piotr@maslowski.xyz>
Message-Id: <CW4UT45DZ5C6.3NIT2IFNSKD4O@andrad>
X-Mailer: aerc 0.15.2
References: <20231009-caleb-notch-example-v1-1-9e0a43ae233c@linaro.org>
In-Reply-To: <20231009-caleb-notch-example-v1-1-9e0a43ae233c@linaro.org>

Hi Caleb,

Thanks for posting this. I've been meaning to chime in on the discussion
about notches and co. for months now, so this makes a perfect opportunity
to finally do so.

On Mon Oct 9, 2023 at 7:32 PM CEST, Caleb Connolly wrote:

> Some folks have previously suggested that this information belongs in
> userspace and not in devicetree. I would like to be clear that
> devicetree is for describing hardware, and parts of a display which can
> never actually be seen are very much properties of the underlying
> hardware.

Yes, thank you! Seeing the kernel log (or Tuxes) partially hidden behind
the notch (or the top-left rounded corner) is just so annoying, so DT is
definitely the way to go here.

> Some discussion has been underway previously on how best to describe
> these features [1][2], including a reference userspace implementation
> using SVG paths [3]. Using this previous discussion as a jumping off
> point, this RFC allows for describing the following display features:
>
> * Corner radius (on a per-corner basis)
> * Circular or pill-shaped cutouts
> * Notches with arbitrary shapes
>
> It's easy to make a case for only using rectangles to describe these
> missing parts of a display, however this severely limits their utility.
> Describing display occlusions as accurately as possible allows for a lot =
of
> useful UX features. For example, displaying a ring around a hole-punch
> camera when it's in use, or wrapping UI elements around a notch. These
> behaviours are only possible to implement when the dimensions are known
> with near pixel-perfect accuracy.


There are two aspects at play here: simplicity and correctness. Fully
sacrificing one for the other would be a grave mistake. But that does
not mean those two are inherently opposed.

I'd argue that they actually go hand in hand. Keeping the format simple
will make gathering and submitting high-quality data easier. Conversly,
accurately describing the hardware requires *not including* redundant
or non-applicable information.


So why am I writing all of this? Well, the problem I see is that any
shape-based approach will likely suffer from both accuracy and
complexity issues. Describing curves is hard and processing them is
not something that should be included in e.g. whatever handles VTs.

[TLDR: you can skip ahead]

Morover, short of some Turing-complete arbitrary path function, it
sacrifices a bit of expressivity and thus correctness as there will
always be shapes you cannot describe accurately. This may be irrelevant
because in practice you don't need those details. But that highlights
a different problem: there will be many distinct ways to describe many
similar things.

It's also hard to tell if a given curve really has the right shape:

* similar shapes exist =E2=80=93 How do you tell whether e.g. a rounded cor=
ner
  is circular or not? If a DT gets that wrong and the UI decides to for
  example draw constant-width padding around such feature it will likely
  look very off and ugly.
* measurement precision is a thing =E2=80=93 Unless you measure everything =
on a
  scale significantly smaller than individual pixels, sections of your
  curves may end up on different pixels than in reality.
* different people have different standards =E2=80=93 And so the quality wi=
ll
  vary greatly between devices.
* corners will be cut =E2=80=93 This is basically the previous point but I
  liked the pun way too much to just delete it, lol
* pixels vs millimeters =E2=80=93=C2=A0Converting between these two will al=
so
  increase the overall wobbliness and worsen the user experience.
  But is it feasible to measure everything in pixels accurately?


Picking a very small set of basic curve shapes might be a good option if
that can cover all the shapes we expect to find in the wild. It does not
resolve the possible accuracy problems but it would at least be simple.

[TLDR =E2=80=93 skip to here]:

However, there's a different approach that is both extremely simple and
yet trivially correct =E2=80=93 pixel masks!

Basically, instead of trying to describe what shape a cutout, notch or
other feature has, we just say which pixels belong to it. In short, this:

- can be easily processed even by 'dumb' programs =E2=80=93 for example, yo=
u can
  derive minimal margins to 'letterbox' the screen
- gathering the data is very straightforward =E2=80=93 just light the relev=
ant
  pixels one-by-one and check if you see them
- pixel-perfect accuracy is the default

Of course this is not a perfect solution. Here are the drawback that I
can see:

- low resolution screens mean low resolution data
- 'smart' programs may or may not need a bit more logic than otherwise
- sub-pixel accuracy is impossible or requires extending this scheme
  - non-binary (fractional) weights
  - partially-occluded pixels on a separate mask (so each feature would
    have two adjacent masks =E2=80=93 for its interior and for the border)


As a futher improvement, besides looking at pixels we could think about
subpixels instead. Still, this can easily be added later and likely even
in a backwards-compatible manner.

An orthogonal issue is labeling all of those regions. I think we should
start with fully obscured areas and maybe less readable ones like the
waterfall edges. Still, different features should live on different
masks =E2=80=93 even if we don't attach meaningfull labels (like 'notch' or
'camera cutout') to them right away.


What do you all think of that? I didn't see this approach considered in
any of the earlier discussions, yet it seems so elegant to me. Am I
missing something?

--
Cheers,
Piotr Mas=C5=82owski
