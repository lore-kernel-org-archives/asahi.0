Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19124A02
	for <asahi@lists.linux.dev>; Fri,  9 Sep 2022 14:16:27 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1662732985; bh=JwFAHcC/4eYphZlFJvNFL6J9NVjJq/CoRrfoZy73gUs=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=g4Q3gU7RsWFdnxwGJGFTG1OiSMEGIlmu3Brl7NvC84c77Z1XA+EfquuLWfcK8m7u9
	 +631amUToG5wtKoVe8WbcHCFit/JhV896ll2vbQp5mcSsAKKNL+Pyo4OJzwaYYKPrp
	 ke8Sf8e203KocpZeq5h8Futbk6bBjxRqCqEZcauE=
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [RFC PATCH 02/10] dt-bindings: dma: apple,admac: Add iommus and
 power-domains properties
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <20220909135103.98179-3-j@jannau.net>
Date: Fri, 9 Sep 2022 16:16:24 +0200
Cc: asahi@lists.linux.dev,
 Mark Kettenis <kettenis@openbsd.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Hector Martin <marcan@marcan.st>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Sven Peter <sven@svenpeter.dev>,
 devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <60F87A29-03D1-4F82-ABEF-A64C38E550FE@cutebit.org>
References: <20220909135103.98179-1-j@jannau.net>
 <20220909135103.98179-3-j@jannau.net>
To: Janne Grunau <j@jannau.net>,
 Vinod Koul <vkoul@kernel.org>


> On 9. 9. 2022, at 15:50, Janne Grunau <j@jannau.net> wrote:
>=20
> Apple's ADMAC is on all supported Apple silicon SoCs behind an IOMMU
> and has its own power-domain.
>=20
> Signed-off-by: Janne Grunau <j@jannau.net>

Acked-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>

Vinod, please pick it up in the dmaengine tree, I may have one patch to
the binding I will post later (with associated driver changes).

