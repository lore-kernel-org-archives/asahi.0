Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6343E7A
	for <asahi@lists.linux.dev>; Wed, 18 May 2022 13:01:42 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id e28so2020781wra.10
        for <asahi@lists.linux.dev>; Wed, 18 May 2022 06:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Pprp1ehwboYEBy8TJbyy6bGcev7J361N43QEkSo64YI=;
        b=RhGYtYKw14C4S63GFuuGhG4HTOwEYvWU9RkJRKeZpHUwhYebC25Aqo49Sk7Y0psOcJ
         9dnD5fGtHgaD4r6yAGlDHPfVr5r3YnGhVreQ58/Nu1BRsOjFXdjA75BXhCaOPNzCAGuV
         g0DDH8KgqRCxRMpDbbbh8XDvIkdjZhYGi0bL7+kTC0HfUl+fKlVUCxaWwZEUOksPJwLo
         eT+FBoD6fBv15BwoztsdQ+8jwM/ISjQa6MoGefQWfopo9kwaHnrJ8QZC4LgoqfxTIppJ
         wCVWp2U0H9lqKesl5edotdF+HnS/++YwqOfI6aRDpj/S8giZUUPfW0WGr/+5zo/q/wrH
         CL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Pprp1ehwboYEBy8TJbyy6bGcev7J361N43QEkSo64YI=;
        b=IEsCansoNIIpvERsHBazCDmWK67bDH4zZb3HoooJ/u5Kgi4fDC0XVejqipEtm81bfC
         gse+lXMopgPqP7MpkMZXTMC8Yesa4hKnfloJuNlwx5tsrLrkoJJ1sKVKGt6VI82gw7oT
         DyX+kcdeCnWGhHwfqkxPdJHKo5aWxnN0HWqRaWYTfc59ABNCgVLhfwHRCmYBhXuKGzgC
         8H+B6jQAqPUiUhk8+N55S2b4MFgtyZU+uHInUZ5meJaDajWafRGjZfAZdgRBgpSsWV/i
         tcp6jJGjfQJt0Xbl7bGjNVMxi5PHOUYnxruMpHgnRYttq+EnVVWUbwq7qtBnojOrfA7+
         0wEw==
X-Gm-Message-State: AOAM531B+GUrSBlMdfF1hccgF04btDuldNBhXAmDxMC3UvF61/cL7+S3
	dKpOpCW2ZRIcdbjfVQJ8yjY=
X-Google-Smtp-Source: ABdhPJzrIkeHaQ1NGzfwuUH4Eoda7bajrEBFoqFBl4/SuIOPjS1XG3nAfyAztcig4B+81i1DIHRSMw==
X-Received: by 2002:adf:d1cf:0:b0:20c:6030:d6f0 with SMTP id b15-20020adfd1cf000000b0020c6030d6f0mr23315458wrd.298.1652878900519;
        Wed, 18 May 2022 06:01:40 -0700 (PDT)
Received: from orome ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id o10-20020a05600c378a00b00394755b4479sm4266977wmr.21.2022.05.18.06.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 06:01:39 -0700 (PDT)
Date: Wed, 18 May 2022 15:01:36 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
	Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH v5 1/5] dt-bindings: reserved-memory: Document
 iommu-addresses
Message-ID: <YoTuMO1A9GcvSbWA@orome>
References: <20220512190052.1152377-1-thierry.reding@gmail.com>
 <20220512190052.1152377-2-thierry.reding@gmail.com>
 <20220515104554.GD26732@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qopHTOouftFIIHkw"
Content-Disposition: inline
In-Reply-To: <20220515104554.GD26732@jannau.net>
User-Agent: Mutt/2.2.4 (c3baa83e) (2022-04-30)


--qopHTOouftFIIHkw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 15, 2022 at 12:45:54PM +0200, Janne Grunau wrote:
> On 2022-05-12 21:00:48 +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > This adds the "iommu-addresses" property to reserved-memory nodes, which
> > allow describing the interaction of memory regions with IOMMUs. Two use-
> > cases are supported:
> >=20
> >   1. Static mappings can be described by pairing the "iommu-addresses"
> >      property with a "reg" property. This is mostly useful for adopting
> >      firmware-allocated buffers via identity mappings. One common use-
> >      case where this is required is if early firmware or bootloaders
> >      have set up a bootsplash framebuffer that a display controller is
> >      actively scanning out from during the operating system boot
> >      process.
> >=20
> >   2. If an "iommu-addresses" property exists without a "reg" property,
> >      the reserved-memory node describes an IOVA reservation. Such memory
> >      regions are excluded from the IOVA space available to operating
> >      system drivers and can be used for regions that must not be used to
> >      map arbitrary buffers.
> >=20
> > Each mapping or reservation is tied to a specific device via a phandle
> > to the device's device tree node. This allows a reserved-memory region
> > to be reused across multiple devices.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../reserved-memory/reserved-memory.txt       |  1 -
> >  .../reserved-memory/reserved-memory.yaml      | 62 +++++++++++++++++++
> >  include/dt-bindings/reserved-memory.h         |  8 +++
> >  3 files changed, 70 insertions(+), 1 deletion(-)
> >  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/r=
eserved-memory.txt
> >  create mode 100644 include/dt-bindings/reserved-memory.h
> >=20
> > diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved=
-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-me=
mory.txt
> > deleted file mode 100644
> > index 1810701a8509..000000000000
> > --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory=
=2Etxt
> > +++ /dev/null
> > @@ -1 +0,0 @@
> > -This file has been moved to reserved-memory.yaml.
> > diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved=
-memory.yaml b/Documentation/devicetree/bindings/reserved-memory/reserved-m=
emory.yaml
> > index 7a0744052ff6..3a769aa66e1c 100644
> > --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory=
=2Eyaml
> > +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory=
=2Eyaml
> > @@ -52,6 +52,30 @@ properties:
> >        Address and Length pairs. Specifies regions of memory that are
> >        acceptable to allocate from.
> > =20
> > +  iommu-addresses:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description: >
> > +      A list of phandle and specifier pairs that describe static IO vi=
rtual
> > +      address space mappings and carveouts associated with a given res=
erved
> > +      memory region. The phandle in the first cell refers to the devic=
e for
> > +      which the mapping or carveout is to be created.
> > +
> > +      The specifier consists of an address/size pair and denotes the IO
> > +      virtual address range of the region for the given device. The ex=
act
> > +      format depends on the values of the "#address-cells" and "#size-=
cells"
> > +      properties of the device referenced via the phandle.
> > +
> > +      When used in combination with a "reg" property, an IOVA mapping =
is to
> > +      be established for this memory region. One example where this ca=
n be
> > +      useful is to create an identity mapping for physical memory that=
 the
> > +      firmware has configured some hardware to access (such as a boots=
plash
> > +      framebuffer).
> > +
> > +      If no "reg" property is specified, the "iommu-addresses" property
> > +      defines carveout regions in the IOVA space for the given device.=
 This
> > +      can be useful if a certain memory region should not be mapped th=
rough
> > +      the IOMMU.
> > +
> >    no-map:
> >      type: boolean
> >      description: >
> > @@ -97,4 +121,42 @@ oneOf:
> > =20
> >  additionalProperties: true
> > =20
> > +examples:
> > +  - |
> > +    reserved-memory {
> > +      #address-cells =3D <2>;
> > +      #size-cells =3D <2>;
> > +      ranges;
> > +
> > +      adsp: reservation-adsp {
> > +        /*
> > +         * Restrict IOVA mappings for ADSP buffers to the 512 MiB regi=
on
> > +         * from 0x40000000 - 0x5fffffff. Anything outside is reserved =
by
> > +         * the ADSP for I/O memory and private memory allocations.
> > +         */
> > +        iommu-addresses =3D <0x0 0x00000000 0x00 0x40000000>,
> > +                          <0x0 0x60000000 0xff 0xa0000000>;
>=20
> This misses the device's phandle. One could argue it's not necessary for=
=20
> reservations but it will complicate the parsing code and the current=20
> parsing code is not prepared for it.

Ugh... I evidently messed this one up. It's not ever close to what I had
in my device trees for testing. I'll make sure to fix those up properly
and also that they pass validation.

> > +      };
> > +
> > +      fb: framebuffer@90000000 {
> > +        reg =3D <0x0 0x90000000 0x0 0x00800000>;
> > +        iommu-addresses =3D <&dc0 0x0 0x90000000 0x0 0x00800000>;
> > +      };
> > +    };
> > +
> > +    bus@0 {
> > +      #address-cells =3D <2>;
> > +      #size-cells =3D <2>;
> > +
> > +      adsp@2990000 {
> > +        reg =3D <0x0 0x2990000 0x0 0x2000>;
> > +        memory-region =3D <&adsp>;
> > +      };
> > +
> > +      display@15200000 {
> > +        reg =3D <0x0 0x15200000 0x0 0x10000>;
> > +        memory-region =3D <&fb>;
> > +      };
> > +    };
> > +
> >  ...
> > diff --git a/include/dt-bindings/reserved-memory.h b/include/dt-binding=
s/reserved-memory.h
> > new file mode 100644
> > index 000000000000..174ca3448342
> > --- /dev/null
> > +++ b/include/dt-bindings/reserved-memory.h
> > @@ -0,0 +1,8 @@
> > +/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
> > +
> > +#ifndef _DT_BINDINGS_RESERVED_MEMORY_H
> > +#define _DT_BINDINGS_RESERVED_MEMORY_H
> > +
> > +#define MEMORY_REGION_IDENTITY_MAPPING 0x1
> > +
> > +#endif
>=20
> This appears to be an unused leftover from a previous version.

Good catch. I'll drop this file from the patch set. It's no longer
needed.

Thanks,
Thierry

--qopHTOouftFIIHkw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmKE7i0ACgkQ3SOs138+
s6FZLhAAgZgV/J4HXhKsFGVwtr5dNJ4o8tI+lP8SJfuR6PztKix7PdK9o+ZcEMKL
wfZLYDjtC87R8X9hVDiMFj2rnIC3Wm8hrKJNfOF1d9RCwB5BEbVP0CE4DV7yAJfo
qigRbeS0GRw2YLCa0JPE8ecjPf3809yA6c4p/12BMk1u661Ahcbl6/dI9foFEjOF
6U3M7qRrRr/XXUzWGY6TMdcUYqaSi+tSwUBu/P4UUKLLGARXFJHt4TEbtWnpbbv1
AhWP1tcrOmmAFgcVTrdsRZNmXo5/Bk7gpqb+VtbjoKvaq5Z0iTG+WmVQrc8e/WYK
OzDHWeF9qmwa/FMu1aXa2wPyTwsHvbRaTgzlYIusnRpXLSYIiz6Xo1hQIedq9hBY
OMfR40YRzJxZeWoGsCen1/t7aIgiIDdL6ymI9izOHKZ9KT4l+1+4T2th1GHZnjRO
m+Ur7ofExMsVPqzolsC1SL+Fl68DxbDpfoguNDIhGLzu4POVgo0R/blPAMmiUyE9
UP+mrzApv0BxJFEuMQWPWxfUou5O4RAyN1shyohylcPE/8MGxyfBXVEC+EG1ecOm
2eLwgC0xBF8cVJ8YK4DCQpZLdV1rm5YyBvDNVZ7yltYRqqVWPvquqs/V+bOJHuCh
zfL+qqGyAJV31y4x+GZ6Rv+pE1+raudX5fq9146gGsO/moYLpBY=
=lOrS
-----END PGP SIGNATURE-----

--qopHTOouftFIIHkw--
