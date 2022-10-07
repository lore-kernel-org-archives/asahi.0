Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF4B1C2D
	for <asahi@lists.linux.dev>; Fri,  7 Oct 2022 13:54:31 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a26so11511883ejc.4
        for <asahi@lists.linux.dev>; Fri, 07 Oct 2022 06:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Enx4RjQIyhd33IM+TyBELZC95J59S4Pgr5DS3EUuMxI=;
        b=gpj8FDZDpI7ZZ947ym7dXZiNVjveu/V+u1fISf6SmQWJg2gbqTO0XOG+EmXfZaVTIT
         5Kzj5pNupn6gpoaHds0HBtixiVNwiN3NbX6L83pCT/MnChWvT+9+P2DiAgZH67g/Di1L
         Lc8JeHvrl0E/i0R0cY+XkHRAS9Uhy2Q8MJ4Mm7kV3LaNoF2F1hGCh80L0nQCgoNd9mFT
         Ji+cPG9OXVLcelxI8y/PSz3JZfu6vaeQX2mvqa5NG457ajgkycuhmoGrMD2HU61p4ErC
         he/0JMcHbyEXa0vIWCtNfvBcBgsWMQEcvvhmk8mr4ZoH1Jc5sdG4eciwGLjTv6XdfMzw
         HebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Enx4RjQIyhd33IM+TyBELZC95J59S4Pgr5DS3EUuMxI=;
        b=Ux9P4qGGh1fjbchWpG0ZAnCCCNQUtFwIWOK3I9UgCncRMIUtcGMONg904abB7X5cOh
         LW7VcCTHwTcAwazLD0sCSOLBrWYt5JUmWXpmd2s2iNMWOoMq4/U1INnxZDFfxNzQvpKU
         xuUMwBo3h6Rt+wE4Rl7cdQLpsUdnvS921+K7VPu1cliU4DwxJUgKo6zg/GHW5lXwBUUS
         +78Dby3q7bEMafZ2LlSEUm0knEsjzF8SI6hMRPiIyu//w54CklUXXVTVmras7Fo2uk+g
         eCFZ8m6cjURubyEm7ICRZBdq++OclXRC2zpTyfE0wSl2CvK3Nhb5fcKlclSzheQvDtj1
         UiVQ==
X-Gm-Message-State: ACrzQf3zitUSB6nsvO3OWKgGFhUZSraZQLOvjQoOSeZqQp6ORq6HyF/t
	SslSu1QqX3d+6EjrlLmQAYo=
X-Google-Smtp-Source: AMsMyM7La77T3ZitZ18KvtNZX+eTUrTaeesjPgbUf2RaeFhRX5epUFC4Oz9+762DvbFsno6Xj8g/rw==
X-Received: by 2002:a17:907:847:b0:77f:f489:cc25 with SMTP id ww7-20020a170907084700b0077ff489cc25mr4192567ejb.80.1665150869489;
        Fri, 07 Oct 2022 06:54:29 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f12-20020a17090660cc00b007415f8ffcbbsm1269503ejk.98.2022.10.07.06.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 06:54:28 -0700 (PDT)
Date: Fri, 7 Oct 2022 15:54:26 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
	Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
	devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
	linux-tegra@vger.kernel.org, asahi@lists.linux.dev,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 1/5] dt-bindings: reserved-memory: Document
 iommu-addresses
Message-ID: <Y0AvkshNYmqc3UGo@orome>
References: <20220923123557.866972-1-thierry.reding@gmail.com>
 <20220923123557.866972-2-thierry.reding@gmail.com>
 <3fb949ad-74c4-1bac-7e14-5d056afcef5f@arm.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5W5c90u2fS2v03qz"
Content-Disposition: inline
In-Reply-To: <3fb949ad-74c4-1bac-7e14-5d056afcef5f@arm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)


--5W5c90u2fS2v03qz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2022 at 02:45:31PM +0100, Robin Murphy wrote:
> On 2022-09-23 13:35, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > This adds the "iommu-addresses" property to reserved-memory nodes, which
> > allow describing the interaction of memory regions with IOMMUs. Two use-
> > cases are supported:
> >=20
> >    1. Static mappings can be described by pairing the "iommu-addresses"
> >       property with a "reg" property. This is mostly useful for adopting
> >       firmware-allocated buffers via identity mappings. One common use-
> >       case where this is required is if early firmware or bootloaders
> >       have set up a bootsplash framebuffer that a display controller is
> >       actively scanning out from during the operating system boot
> >       process.
> >=20
> >    2. If an "iommu-addresses" property exists without a "reg" property,
> >       the reserved-memory node describes an IOVA reservation. Such memo=
ry
> >       regions are excluded from the IOVA space available to operating
> >       system drivers and can be used for regions that must not be used =
to
> >       map arbitrary buffers.
>=20
> Bah, I've only just realised: don't we also need to change the "oneOf:
> required: ..." schema to permit "iommu-addresses" without "reg" or "size"?

Hm... good point. I think at least we'll want another:

     - required:
         - iommu-addresses

in there. I wonder if we also need to avoid the combination of "size"
and "iommu-addresses". When "size" is specified, is it guaranteed that
those regions will be allocated before the direct mapping needs to be
created?

Thierry

--5W5c90u2fS2v03qz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNAL5IACgkQ3SOs138+
s6HMjg/9Ez5oe7o7RKjlGxLRasyNNnpD5dUT5ZmEPcxWBlLBs+6fYqmvVi5DycrV
857CsTJED2/fHahH5TQqsUJmQ4jWtS7Z9Aw74dEMjVqAAtJOmzT0nAyXrgSSaV4E
EoOqSM8O++HDS8qUlFqI7CJMXpuUv9hfoDit0m4tSg6fFPKNO5fhWg8oNAgXaKqQ
MhBZyLjb0dqCFP/2tfLR0PoLhYv9p4kfu/tcH2HNbScAQDIb61yRRro/bw+q3ABn
a63qkZlW0ow8MepXiTfqVbZVToWrP6aSrIAgDgQhi4eQOr4WiHHS0U/t2atgW0Hc
LNLC534Hii+aIYSNK6xjDtvbEp2JS0jBVIqpJr6dCOY7jnsGLLwa5GJeNRaPbksE
XZ3QvChk9RGv7plPjIVAf23kDethEZEyfEOB93czUH1yQ97+zYQFbNJ06hrjYy0f
JbZ6pehcwEiP6PfkP54hzUBsgZrxu6a6INYvxArsEywj0IGhxpzLd/7yWbZ3sewm
FQQ03w4RguTfAZBog9+ckWCJKJQId9N2lexIT0XU5vMBZvj06yQdXOxLqTsPs24M
rF2efBe1iCzIOxx7O/ki11AJhTAhLMAbblT75FtJfLaL+v8XdkyjEpx/iz8M+MUu
hus7GIQTd7f6SpYF77unDhcBvJKeT9LQVucyaEtKo84eCFhDIqA=
=3sh+
-----END PGP SIGNATURE-----

--5W5c90u2fS2v03qz--
