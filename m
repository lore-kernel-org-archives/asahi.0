Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E882806
	for <asahi@lists.linux.dev>; Sun, 15 May 2022 10:43:12 +0000 (UTC)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
	id CDF9C26EA99; Sun, 15 May 2022 12:35:44 +0200 (CEST)
Date: Sun, 15 May 2022 12:35:44 +0200
From: Janne Grunau <j@jannau.net>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
	Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH v5 0/5] iommu: Support mappings/reservations in
 reserved-memory regions
Message-ID: <20220515103544.GC26732@jannau.net>
References: <20220512190052.1152377-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512190052.1152377-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hej,

I'm working on the display controller for Apple silicon SoCs and will 
add some comments with support for it in mind.

added asahi@lists.linux.dev to CC for the Apple silicon related aspects

On 2022-05-12 21:00:47 +0200, Thierry Reding wrote:
> 
> this is another attempt at solving the problem of passing IOMMU
> configuration via device tree. It has significantly evolved since the
> last attempt, based on the discussion that followed. The discussion can
> be found here:
> 
>   https://lore.kernel.org/all/20210423163234.3651547-1-thierry.reding@gmail.com/
> 
> Rather than using a memory-region specifier, this new version introduces
> a new "iommu-addresses" property for the reserved-memory regions
> themselves.

If experimented with both proposed bindings for dcp and I think this 
binding is easer to understand and to work with.

> These are used to describe either a static mapping or
> reservation that should be created for a given device. If both "reg" and
> "iommu-addresses" properties are given, a mapping will be created
> (typically this would be an identity mapping)

dcp on Apple silicon will not use identity mappings. The IOMMU supports 
identity mapping but the pre-configured mappings setup by Apple's system 
firmware will not work with identity mapping. It maps multiple regions 
which are incompatible with a linear identity mapping. In addition the 
embbeded aarch64 micro controllers used in the display subsystem appears 
to use a heap mapped at low IOVA space starting at 0.

> whereas if only an "iommu-addresses" property is specified, a 
> reservation for the specified range will be installed.
> 
> An example is included in the DT bindings, but here is an extract of
> what I've used to test this:
> 
> 	reserved-memory {
> 		#address-cells = <2>;
> 		#size-cells = <2>;
> 		ranges;
> 
> 		/*
> 		 * Creates an identity mapping for the framebuffer that
> 		 * the firmware has setup to scan out a bootsplash from.
> 		 */
> 		fb: framebuffer@92cb2000 {
> 			reg = <0x0 0x92cb2000 0x0 0x00800000>;
> 			iommu-addresses = <&dc0 0x0 0x92cb2000 0x0 0x00800000>;
> 		};

The binding supports mapping the same region to multiple devices. The 
code supports that and it will be used on Apple silicon. Not necessary 
to extend and complicate the example for I wanted to mention it 
explicitly.

> 
> 		/*
> 		 * Creates a reservation in the IOVA space to prevent
> 		 * any buffers from being mapped to that region. Note
> 		 * that on Tegra the range is actually quite different
> 		 * from this, but it would conflict with the display
> 		 * driver that I tested this against, so this is just
> 		 * a dummy region for testing.
> 		 */
> 		adsp: reservation-adsp {
> 			iommu-addresses = <&dc0 0x0 0x90000000 0x0 0x00010000>;
> 		};
> 	};
> 
> 	host1x@50000000 {
> 		dc@54200000 {
> 			memory-region = <&fb>, <&adsp>;
> 		};
> 	};
> 
> This is abbreviated a little to focus on the essentials. Note also that
> the ADSP reservation is not actually used on this device and the driver
> for this doesn't exist yet, but I wanted to include this variant for
> testing, because we'll want to use these bindings for the reservation
> use-case as well at some point.
> 
> Adding Alyssa and Janne who have in the past tried to make these
> bindings work on Apple M1. Also adding Sameer from the Tegra audio team
> to look at the ADSP reservation and double-check that this is suitable
> for our needs.

The binding itself is sufficient for the needs of the display subsystem 
on Apple silicon. The device tree parsing code for reserved regions is 
of limited use in it's current form. We will have either to extend or 
duplicate it to retrieve the non-identity mappings. That's our problem 
to solve.

Janne
