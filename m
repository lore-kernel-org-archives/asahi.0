Received: from mail.maslowski.xyz (mail.maslowski.xyz [45.77.158.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D2D21423C
	for <asahi@lists.linux.dev>; Tue, 17 Feb 2026 18:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.77.158.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771354196; cv=none; b=AB4iDbiOVU59vZwlrX36wDg7i+hnnvwEnRNb/TC47J+Ib0K5uvC2mOBgG6BWsqF0UVgGPtibJidFPAp0ccqpJ6fgCGDYIIL6afHVHkZ2K88BYYL3KSWaftE91npQWaz6KZeUQCDodnlln7X52azLoeANChRAhrIrt69CStLy9mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771354196; c=relaxed/simple;
	bh=P0258aC6MmtT+1ZfwB5gA+rAVOA1C+jLyAos6sdKqjg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oRoYw39whum5HxB3H45RPHUpcSkvps4LsisvPLM8fY8yMgelCbc8l4F0PvSc+h7bDaRZZvWgV92qpJoPrP/qEJA8InzRvKv2L5vCb3w7jkbCNFsAmQNNrXs0FlBShqDpg6ve8UCN+qLkZUGHwnhreTIqg7xZtzzMNFYN1SnvEdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=maslowski.xyz; spf=pass smtp.mailfrom=maslowski.xyz; dkim=pass (2048-bit key) header.d=maslowski.xyz header.i=@maslowski.xyz header.b=RxIXYVdC; arc=none smtp.client-ip=45.77.158.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=maslowski.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maslowski.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maslowski.xyz header.i=@maslowski.xyz header.b="RxIXYVdC"
Received: from localhost (unknown [IPv6:2a00:f41:3430:d49a:e0df:b5bf:721a:d71a])
	by mail.maslowski.xyz (Postfix) with ESMTPSA id A7E927D5AD;
	Tue, 17 Feb 2026 18:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=maslowski.xyz;
	s=mail; t=1771354193;
	bh=P0258aC6MmtT+1ZfwB5gA+rAVOA1C+jLyAos6sdKqjg=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=RxIXYVdCS+EouvRtMD2QV3w+aUEFm02VnLNjgJ0545Wdi74SjZH4wl7xaecE3yCxj
	 /Ri0RzL7Kw8SFRDBnhWxh5gZpKbQrmgS0Ut77X48QKPzWhVbGAg4HG6FyBtRQAo/G7
	 Jjclfsu5zfh4hSpglHzVxQQBUhgKLVWsYAPSn26nE7K0oTExnsmNzh/6Ih56cF2hQp
	 yScJpsdAIrssBjYXfofv/10LYIVxF2DPOCjCegD6IEOBDErQuRb5FY3R7CwQ2hzF0F
	 /QuVNeJ1dPeE9B3ToVOSDc+wPIkP8Q/PaoD9fZWfsJOCr2PhHN2Ry0EzC7TgSTQAyJ
	 kC7blDeSxxHUg==
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 19:49:49 +0100
Message-Id: <DGHGNKLEQTJ2.1GR9DDZ0JLI2C@maslowski.xyz>
Cc: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "povik+lin@cutebit.org" <povik+lin@cutebit.org>,
 "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
 "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
 "linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] sound: soc: Add SPDX ids to many soc files
From: =?utf-8?q?Piotr_Mas=C5=82owski?= <piotr@maslowski.xyz>
To: "Bird, Tim" <Tim.Bird@sony.com>, "Richard Fontana" <rfontana@redhat.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260214004314.3787727-1-tim.bird@sony.com>
 <DGHCVCRACU6X.2KYOL2RQWEUG7@maslowski.xyz>
 <CAC1cPGwgwPJUssJwtUmVydXEGeL-3vD7h2z5_Hb+4g=mYJfhHg@mail.gmail.com>
 <DGHF0NAEUWLD.1Z9W1ZU9LLR0H@maslowski.xyz>
 <PH0PR13MB563954A63CA5E752C8DD8FF4FD6DA@PH0PR13MB5639.namprd13.prod.outlook.com>
In-Reply-To: <PH0PR13MB563954A63CA5E752C8DD8FF4FD6DA@PH0PR13MB5639.namprd13.prod.outlook.com>

On Tue Feb 17, 2026 at 7:10 PM CET, Tim Bird wrote:
[...]
> The kernel documentation recommends GPL-2.0 instead of GPL-2.0-only.
> See  https://docs.kernel.org/process/license-rules.html
>
> So my general guideline to myself is to use GPL-2.0 when there's no estab=
lished
> pattern in a directory.  However, when there is already code with an SPDX=
 ID in a directory
> or from an author, I use whichever one has already been assigned (if it's=
 clear).
> This is to keep consistency and honors previous decisions about which of =
the
> equivalent IDs to use. sound/soc/apple/mca.c already had a GPL-2.0-only I=
D,
> and I should have used that for both the Kconfig and the Makefile, by tha=
t guideline.
>
> However, there is also consistency by file type.  There are a few more us=
es of
> GPL-2.0 than GPL-2.0-only in Makefiles throughout the kernel.  But in thi=
s
> case I think that the directory/author consistency should take precedence=
 over
> the file type consistency.
>
> So I messed up in this case.  My recollection is that I did this SDPX app=
lication in
> two different sweeps of the directory, (that is by file type instead of a=
ll files at the
> same time in this dir.) The application of the SPDX ID for the Makefile w=
as done at
> a different time than the application of the SPDX ID for the Kconfig. [..=
.]

Oh wow! That is definitely a lot to remember each time and consider. So
delegating it to an external tool, as you say, is certainly a good idea.

> (and maybe a new tool to check for inconsistencies like this) to avoid th=
is in the future.
>
> The Makefile should have had GPL-2.0-only, to match mca.c and Kconfig.
>
> I will submit a new V2 patch with the Makefile having a GPL-2.0-only ID.
>
> Thanks for catching this!

Only by chance. This time I forgot and did not do my due dilligence
(like at least consulting the documentation, for example).

Best regards,
Piotr Mas=C5=82owski
