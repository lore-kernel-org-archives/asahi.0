Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A72DDB4
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 17:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cutebit.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cutebit.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org header.b="gWSwdjK4"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1698599452; bh=qqFFfHBHXxc/vngEYN7PGSdvv72J5iWHr+qOTphN6Io=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=gWSwdjK4WQs8sn+bwfMnOmyLeSs2iQt1mq45yaHM3oreInK8s1UO7jN5IiKTeO+bC
	 fGaz5XZnbSq5149tfmhcXo6wryLDzl8PGWBS6Lt1xsLjVYH5hr6LzcVjfRDNWIA4ZW
	 in+71aaNRTNvrn+SEYjAjyiL+ZH1A27ER1tbzA08=
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH] dmaengine: apple-admac: Keep upper bits of REG_BUS_WIDTH
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <20231029170053.82146-1-povik+lin@cutebit.org>
Date: Sun, 29 Oct 2023 18:10:41 +0100
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 asahi@lists.linux.dev,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 dmaengine@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <00401D09-6037-44AE-91CC-34379ED9589E@cutebit.org>
References: <20231029170053.82146-1-povik+lin@cutebit.org>
To: Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>,
 Vinod Koul <vkoul@kernel.org>


> On 29. 10. 2023, at 18:00, Martin Povi=C5=A1er <povik+lin@cutebit.org> =
wrote:
>=20
> From: Hector Martin <marcan@marcan.st>
>=20
> For RX channels, REG_BUS_WIDTH seems to default to a value of 0xf00, =
and
> macOS preserves the upper bits when setting the configuration in the
> lower ones. If we reset the upper bits to 0, this causes framing =
errors
> on suspend/resume (the data stream "tears" and channels get swapped
> around). Keeping the upper bits untouched, like the macOS driver does,
> fixes this issue.
>=20
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Reviewed-by: Martin Povi=C5=A1er <povik@cutebit.org>
> Signed-off-by: Martin Povi=C5=A1er <povik@cutebit.org>
> ---

Please take up v2 instead. I slipped in the wrong email address in here,
which I don=E2=80=99t want to subscribe for kernel spam with.

=
https://lore.kernel.org/dmaengine/20231029170704.82238-1-povik+lin@cutebit=
.org/T/#u

Thanks!

Kind regards,
Martin

