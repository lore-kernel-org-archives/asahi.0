Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.65.109.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368888;
	b=qR5VKmqVbhnbwlqeaPePgS5euYE6uHQX4Nt1LNELWeGfQZ3iYPM2PjlueZbOj05w23TQ
	 oZr2E01elLwGZ9J1KXPfA+iwj6uZVgfp/D3HQAuPrRHISwjZp78kcBHmyVUnt/7GkV79j
	 LuUqa3KnOqwXRmmikdUAqj6+63d9p5xXzLvY0yXRCsgPbrxlqVEn2DabOqfGIoPTJmj2j
	 1dCc6uSRCT3d8HyIINkx8rxNryb6dJm7LGXb1oUSP60yKzxhtHpHYCSth95GXokbjCQPV
	 y8Cb2adIv5Rzpo0ra0EF+l/bcot/9cIaE0LODQAGWuZVwRJGTnjeRvO33ZBdsryZ+hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368888;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:Jabber-ID;
	bh=r2Lam0T+BA/HujRcsyvJC9BL9O4RDGTnvemyk2p/XQo=;
	b=BglYNB1NegdYMUE6UiCuFzG2m9Y6wtwxN6OKEJIdsCRG1kBQnEwDhpb3BiF/z8DFqY11
	 7K/Li+qp/KiDoYUlEevnX1/0ZZnX3bWA+HmRHZwpN7iqBuOgBwaTsoKufW1bMsSmhDA+W
	 os6SfM7UhCXC2U3bID9TosgYUCcPBmoaOtj8K/ktb0x0GpM/viGdk+yMXmfi2DnDvI0yG
	 QHOXu8IEFYLTbPCjfaS24YikG2tmaZtUfvxa9W4jHL91gfB3m88JDvccKrx3bALWigbYX
	 Y6lXGCkr4umZtSiiQrnXU5Vy71p6AcqHrouKnmy+dQslz6Ks+B9DR+rJd3jSd0AR3ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linkmauve.fr;
	spf=pass smtp.mailfrom=linkmauve.fr;
	arc=none smtp.remote-ip=82.65.109.163
Received: from linkmauve.fr (linkmauve.fr [82.65.109.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AA5606A31C;
	Fri, 30 Oct 2026 14:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10AA5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 68C167229E5E; Fri, 30 Oct 2026 15:01:25 +0100 (CET)
Date: Fri, 30 Oct 2026 15:01:25 +0100
From: Link Mauve <linkmauve@linkmauve.fr>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kalyani Akula <kalyani.akula@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Johan Hovold <johan@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7 0/3] nvmem: migrate to const void * in reg_write
Message-ID: <auSjNcZpaWzqY3on@desktop>
References: <20261012195213.875403-1-linkmauve@linkmauve.fr>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261012195213.875403-1-linkmauve@linkmauve.fr>
Jabber-ID: linkmauve@linkmauve.fr

Hi,

On Mon, Oct 12, 2026 at 09:52:07PM +0200, Link Mauve wrote:
> This callback used to take a mutable void * for no reason, which causes
> the compiler to be unaware that the val buffer should never be modified
> by the callback.
> 
> This was found while drafting the nvmem-provider Rust abstraction.
> 
> Thanks to the guidance of Andy Shevchenko, this now introduces a new
> callback and deprecates the existing one, with the goal of renaming the
> new one into the old one once no user remains in the kernel.
[…]

How could we proceed to merge this series in time for 7.4?  I’d really
like to get done with it and move back to the Rust abstractions.

-- 
Link Mauve
