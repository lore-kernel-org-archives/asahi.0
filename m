Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6934653A5
	for <asahi@lists.linux.dev>; Thu, 29 Sep 2022 17:40:17 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1664473208; bh=+tSZFKbdvZWoKMzR6iGa9lHAoFeV6hdZ0rUHvW7OGxA=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=aUAW32jD+aP7mmtNX2LQYWs/MD0I0GmQisxaT44WHXAVeagRLcMdq0FPNkZ32CIEA
	 hJJcMAd/KirCWXqknBO0WaSJbDPplJFsdvMyBI9CTARaupas5At9dGqhtV5Ad5MgTP
	 MOIv3M4FrMU8vxQALx0ueyOxrJ1e7PLaZJ7p7vyo=
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH v1 01/10] dt-bindings: dma: apple,admac: Add iommus and
 power-domains properties
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <YzXIVM6zGszDa2JQ@matsya>
Date: Thu, 29 Sep 2022 19:40:05 +0200
Cc: Janne Grunau <j@jannau.net>,
 asahi@lists.linux.dev,
 Mark Kettenis <kettenis@openbsd.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Hector Martin <marcan@marcan.st>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Sven Peter <sven@svenpeter.dev>,
 devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <EE079966-79EE-47D4-A8AC-5DC404A62A1E@cutebit.org>
References: <20220916142550.269905-1-j@jannau.net>
 <20220916142550.269905-2-j@jannau.net> <YzXIVM6zGszDa2JQ@matsya>
To: Vinod Koul <vkoul@kernel.org>


> On 29. 9. 2022, at 18:31, Vinod Koul <vkoul@kernel.org> wrote:
>=20
> On 16-09-22, 16:25, Janne Grunau wrote:
>> Apple's ADMAC is on all supported Apple silicon SoCs behind an IOMMU
>> and has its own power-domain.
>=20
> Applied, thanks

Hi Vinod,

this has been picked up by Hector and is staged in asahi-soc/dt [0].
I see you haven=E2=80=99t pushed yet. Would it be possible to drop the =
patch
on your end so we don=E2=80=99t end up with two commits for the same =
change?
(I assume that would be an issue.)

To recapitulate: There are two ADMAC binding changes to go in for 6.1,
they are both in asahi-soc/dt. I know I initially asked you to apply
this patch when the series was an RFC.

Thanks,
Martin

[0] =
https://github.com/AsahiLinux/linux/commit/3ac3865735a83bd1c0dae7ad73b7462=
1774755cb

> --=20
> ~Vinod
>=20

