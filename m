Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317292F3B
	for <asahi@lists.linux.dev>; Tue,  8 Nov 2022 14:33:16 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id z14so21280505wrn.7
        for <asahi@lists.linux.dev>; Tue, 08 Nov 2022 06:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9Dt2BOKAc3+oQGAFlOt/P8C9AN1In+LLkCOyLdR9Cs=;
        b=kSFAG05TYa+PUIYn5bCvMnCN1XpdI3zUzVpC/tBnZgSPhVgYcdLtq3CanojS6DjC3D
         BdMEk6Iki+rBt8bMchPmSPED0t1XOw7DCsl3AkjW2/g97hhkyAyXvj90zU0ypvLL7oxH
         WsQj3GJWPXWoefGgCLytA/cTbr6QG+HTXf2l+zP86tzcLhuVL3Dpu2KcCXUmgzhPRtIY
         3q2hYpUFIBhgTgVBSFs0pntWAk2l1IpNbZB4q7kUnydDENewwyBoJ3ZxkD7BOEOqhL/f
         FkIrwRbFb5Daq4dDf9+d/XjOJwvdAvLuXSa8JF8rzNM6OfaJ+exueF7uWdAi/BDloMFV
         hqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9Dt2BOKAc3+oQGAFlOt/P8C9AN1In+LLkCOyLdR9Cs=;
        b=YER3Zxtp47Kj69+gEa3rviMpVMJWha00AsMsJ21wGgK+99MDkWq48GvFrXe6LjR+ds
         zkqz6RcGP0RZPQeViq9urnN8uO9RC81eIe+dTwLQllacI49cVtI5fN+Lipa8dY/epbZT
         P5cVYc3w2jZBfkNEudOniggWDUJMexa8x+ZtwsZfDHFv9qShZeHhpAtkNq9K5occJJKF
         +PK3Il+zxvk+ULbI8YFfiGCEP2n5gojFA0kTN3fF2vSWgaDzmCrg3FCZE8idZMVtCi4F
         ilg6Qf7fAgDJ6yDiK/mdGrUco8c2ezpueyZfR+iwt9WPsCGGx491uafxOvQ8mtOFh1St
         1/wQ==
X-Gm-Message-State: ACrzQf0Uz5InFXoG8vb/JUkSfCOcjZyUbPjgPtwdjuutBCejOTQXK+2a
	TGkdWjTpFEtX5mAe9/QwL1o=
X-Google-Smtp-Source: AMsMyM4pVarTAWhRJ9mcTYzwUxePX1hJetsp9oZMFZ4ONLaWDj+Up3toOfP1y3D+1odIS3Cbp62jZA==
X-Received: by 2002:a5d:58d8:0:b0:236:90a2:4334 with SMTP id o24-20020a5d58d8000000b0023690a24334mr35966376wrf.298.1667917994313;
        Tue, 08 Nov 2022 06:33:14 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id w12-20020a05600c474c00b003b435c41103sm7551897wmo.0.2022.11.08.06.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 06:33:13 -0800 (PST)
Date: Tue, 8 Nov 2022 15:33:11 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
	Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
	devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
	linux-tegra@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH v10 2/5] of: Stop DMA translation at last DMA parent
Message-ID: <Y2popxNd2uIdXmlf@orome>
References: <20221103133900.1473855-1-thierry.reding@gmail.com>
 <20221103133900.1473855-3-thierry.reding@gmail.com>
 <20221107193035.GA1394942-robh@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XQhP36MbZqgHuQxm"
Content-Disposition: inline
In-Reply-To: <20221107193035.GA1394942-robh@kernel.org>
User-Agent: Mutt/2.2.7 (2022-08-07)


--XQhP36MbZqgHuQxm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2022 at 01:30:35PM -0600, Rob Herring wrote:
> On Thu, Nov 03, 2022 at 02:38:57PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > DMA parent devices can define separate DMA busses via the "dma-ranges"
> > and "#address-cells" and "#size-cells" properties. If the DMA bus has
> > different cell counts than its parent, this can cause the translation
> > of DMA address to fails (e.g. truncation from 2 to 1 address cells).
>=20
> My assumption in this case was that the parent cell sizes should be=20
> increased to 2 cells. That tends to be what people want to do anyways=20
> (64-bit everywhere on 64-bit CPUs).
>=20
> > Avoid this by stopping to search for DMA parents when a parent without
> > a "dma-ranges" property is encountered. Also, since it is the DMA parent
> > that defines the DMA bus, use the bus' cell counts instead of its parent
> > cell counts.
>=20
> We treat no 'dma-ranges' as equivalent to 'dma-ranges;'. IIRC, the spec=
=20
> even says that because I hit that case.
>=20
> Is this going to work for 'dma-device' with something like this?:
>=20
>   bus@0 {
>     dma-ranges =3D <...>;
>     child-bus@... {
>       dma-device@... {
>       };
>     };
>   };
>=20
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v10:
> > - new patch to avoid address truncation when traversing a bus hierarchy
> >   with mismatching #address-cells properties
> >=20
> > Example from Tegra194 (redacted for clarity):
> >=20
> > 	reserved-memory {
> > 		#address-cells =3D <2>;
> > 		#size-cells =3D <2>;
> > 		ranges;
> >=20
> > 		framebuffer@0,0 {
> > 			compatible =3D "framebuffer";
> > 			reg =3D <0x2 0x57320000 0x0 0x00800000>;
> > 			iommu-addresses =3D <&dc0 0x2 0x57320000 0x0 0x00800000>;
> > 		};
> > 	};
> >=20
> > 	bus@0 {
> > 		/* truncation happens here */
> > 		#address-cells =3D <1>;
> > 		#size-cells =3D <1>;
> > 		ranges =3D <0x0 0x0 0x0 0x40000000>;
> >=20
> > 		mc: memory-controller@2c00000 {
> > 			#address-cells =3D <2>;
> > 			#size-cells =3D <2>;
>=20
> I think this is wrong. The parent should have more or equal number of=20
> cells.

I was half suspecting that. The reason why I hesitated is that I recall
having the opposite discussion a while ago when we were adding bus@0 to
64-bit Tegra devices. We had at some point (probably around Tegra114 or
Tegra124, 32-bit ARM chips that support LPAE) started to set #address-
cells =3D <2> precisely because the CPU could address more than 32-bit
addresses. We then did the same thing transitioning to 64-bit ARM. When
we then started discussing bus@0, someone (might have been you) had
argued that all these peripherals could be addressed with a single cell
so there'd be no need for #address-cells =3D <2>, so then we went with
that.

Reverting back to #address-cells =3D <2> is now going to cause quite a bit
of churn, but I guess if it's the right thing, so be it.

Another possible alternative would be to move the memory-controller node
=66rom the bus@0 to the top-level. Not sure if that's any better.

Thierry

--XQhP36MbZqgHuQxm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNqaKUACgkQ3SOs138+
s6HZSBAAvBeOQyuRlcZ0RmbGOjMoxgzqF3sYSXCBI3JqFs53jUcdo9g32jbHxjz4
RY+JTBgzaNUDHUbeG1zVI82D1GHrtWYClx+ZBJ3mzKYifZaaaTbdva2LxDgzlhUw
IYtSqwwuINxt1BLKCX6efJGmSNex390ePZFCYzQ1XRxVPKCdrm4p7ov0h2wNlCdJ
hkA6Lc/hxEhSwN/MixHN194uFrtFkYHBhEgkRnHaMejiDqhiMScuDBBgCd97w0vR
Smg2vFAsYxWWi792JmIl2eSAeMRHSMw4/oQw24NkU12iwkVpQbTq4aIqh67tQyXy
en57kI7NCTc1fyqvDDj2G2OROrQeaKDOiGdAbtERgHkMHPTcKtWA0egJJ7sCu8xU
SVyy/txkOfCel/sUn4MLOu5juVO63i+IXhDxJx6qWfsfyIswTn1JL8qAM2yHyLdI
LdvyTie5eKgSQiqsnaga1qld6HLZAtUQ7D7Z15RAiVplQ5IHs6vmHKiPp5PTRIGl
YTPydbPtoIrlaW42/ZjfQnYRuq3r/LI0+cuGFgiKyMPPkjzDBV+m4sjvumaJt+wb
fhMB0tbtsAPuCVxrIngSXSs0iUrkido7craqcCYvMFSKQ8c9HDgbHyf46uFJ4vJJ
/JatA1u9kp2SP7lkLG0Wdm/lxxlz5tJPffKCSgyarToKMnA83ag=
=pIsq
-----END PGP SIGNATURE-----

--XQhP36MbZqgHuQxm--
