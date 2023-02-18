Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82380378
	for <asahi@lists.linux.dev>; Sat, 18 Feb 2023 02:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5E7C433D2;
	Sat, 18 Feb 2023 02:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676685977;
	bh=5xIQ2dHhiBWicvk4sy4hb4AODy+qsSgLqKodHuCFD+M=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XczH8us6N2O/a4kQ00+R5STZqwpXbgzsZFhXpjsCkPnMhG7BTsRmR9SRi3eGz6X0m
	 sGzmltNIuo3un6GgNTsFrr5YhS0MQvwN6losC8vL4bAWIVgtIMbajdmIXklxKjECn6
	 7lFDBs+AUqY3f1vclm7nyZzAXyqANI99vvwClkYekhlwqOmDAMqpPSdTM06H1sIgXi
	 JxrxxAJxt4bRtC+uIgRTJEGQTFOxrgNxi2TQ6Tq6oglaMminiz/xWnVhTeX3Ct4LVH
	 6okSBjAkcbHsK0XCdzSnOJVJC+BuHCR9XO7v9Utf/tsdMGXFU5VtQuhfZnPTn0/izv
	 YKF1C0jQx/Peg==
Message-ID: <734ae9592bfaef54223f74d17fb9dfd8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230202-asahi-t8112-dt-v1-13-cb5442d1c229@jannau.net>
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net> <20230202-asahi-t8112-dt-v1-13-cb5442d1c229@jannau.net>
Subject: Re: [PATCH 13/17] dt-bindings: clock: apple,nco: Add t8112-nco compatible
From: Stephen Boyd <sboyd@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Kettenis <kettenis@openbsd.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Sven Peter <sven@svenpeter.dev>, =?utf-8?q?=EF=BF=BDer?= <povik+lin@cutebit.org>
Date: Fri, 17 Feb 2023 18:06:14 -0800
User-Agent: alot/0.10

Quoting Janne Grunau (2023-02-12 07:41:23)
> The block found on Apple's M2 SoC is compatible with the existing driver
> so add its per-SoC compatible.
>=20
> Signed-off-by: Janne Grunau <j@jannau.net>
>=20
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
