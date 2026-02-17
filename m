Received: from mail.maslowski.xyz (mail.maslowski.xyz [45.77.158.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32FB36E480
	for <asahi@lists.linux.dev>; Tue, 17 Feb 2026 17:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.77.158.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771349579; cv=none; b=saTe4/udCc+1mVbtQb5voNIV26n/LT76F0ajO1Ygi9/mgk4eHTktQUm39hYjWM1He6WMkOc5CAocS9hKigiDF2b76CDDH+frCXUO5u7gZG4N9Y19LaI0uRGlASmErOIFMDmagJPVo4cUCHii2vQx7UWGG4coUjz4Q8kpvZrNO0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771349579; c=relaxed/simple;
	bh=/wMZ3TPuXPQxTNkjO/FKmGAyXbY9LJBoEC84jFm5YnQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=lbKTGmxSJfXJl7J7HfcSlWAyWtGqIG6Glisynqb/4Nby9tadqTyB7OXjkpys+6vwVzLbMaQzrRS0u/sDjhBv8fxCZWsaNnLcsPXTr0zFQhYilCS/HKfrh7GpjPv1cOcevU1BmzZbwd/Os+Q+hoO3kYRKXmSg8txrVvX7cHrPrDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=maslowski.xyz; spf=pass smtp.mailfrom=maslowski.xyz; dkim=pass (2048-bit key) header.d=maslowski.xyz header.i=@maslowski.xyz header.b=l9698Jz9; arc=none smtp.client-ip=45.77.158.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=maslowski.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maslowski.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maslowski.xyz header.i=@maslowski.xyz header.b="l9698Jz9"
Received: from localhost (unknown [IPv6:2a00:f41:3430:d49a:2fda:914f:531e:90a9])
	by mail.maslowski.xyz (Postfix) with ESMTPSA id 21B4E7D5A4;
	Tue, 17 Feb 2026 17:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=maslowski.xyz;
	s=mail; t=1771349575;
	bh=/wMZ3TPuXPQxTNkjO/FKmGAyXbY9LJBoEC84jFm5YnQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=l9698Jz917dW+Yx7wtv0UgQmF+GY9uv/14hxQfdHeOKAiZmEAKcWoPDjBSN1XkxQM
	 x2uDYh0I9MDaMOP1LkwXxsl5b/deMhjnl4l7TzLkK3mqbNNfQcik0tJ+qg08L1iZ2D
	 /MUjFUyWqb6IingHh56GgbM5lsJMVy8ovHjJe/ASw/SlT8C7XdKiEDmjxDs0A56ven
	 BECHwj3+6mnIvPJ25NR5Sa1/2z9n7W3JUGxj7vREKBl4RL+GCGoX40wlNKDYuUod89
	 nO7Y55zQOqxPoesAFooaUgAXwhcsaQWq+yNhy8pDIv35hctBzIsqHlHMeUjWlu70Ca
	 PXW9aTElrvobw==
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 18:32:51 +0100
Message-Id: <DGHF0NAEUWLD.1Z9W1ZU9LLR0H@maslowski.xyz>
Cc: "Tim Bird" <tim.bird@sony.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <povik+lin@cutebit.org>,
 <david.rhodes@cirrus.com>, <rf@opensource.cirrus.com>,
 <cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
 <yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
 <kai.vehmanen@linux.intel.com>, <linux-spdx@vger.kernel.org>,
 <asahi@lists.linux.dev>, <patches@opensource.cirrus.com>,
 <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] sound: soc: Add SPDX ids to many soc files
From: =?utf-8?q?Piotr_Mas=C5=82owski?= <piotr@maslowski.xyz>
To: "Richard Fontana" <rfontana@redhat.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260214004314.3787727-1-tim.bird@sony.com>
 <DGHCVCRACU6X.2KYOL2RQWEUG7@maslowski.xyz>
 <CAC1cPGwgwPJUssJwtUmVydXEGeL-3vD7h2z5_Hb+4g=mYJfhHg@mail.gmail.com>
In-Reply-To: <CAC1cPGwgwPJUssJwtUmVydXEGeL-3vD7h2z5_Hb+4g=mYJfhHg@mail.gmail.com>

On Tue Feb 17, 2026 at 5:26 PM CET, Richard Fontana wrote:
> On Tue, Feb 17, 2026 at 11:00=E2=80=AFAM Piotr Mas=C5=82owski <piotr@masl=
owski.xyz> wrote:
>>
>> > +# SPDX-License-Identifier: GPL-2.0-only
>> [...]
>> > +# SPDX-License-Identifier: GPL-2.0
>>
>> Is there some intended meaning behind this distinction? Bear in mind
>> I'm not a kernel developer so I might very well be missing something,
>> but AFAIK the `GPL-2.0` SPDX identifier is just an older, deprecated
>> variant with the same meaning as `GPL-2.0-only`. (Just like `GPL-2.0+`
>> which is a deprecated version of `GPL-2.0-or-later`.)
>
> Several years ago the FSF persuaded the SPDX legal team to deprecate
> GPL-2.0/GPL-2.0+ in favor of GPL-2.0-only/GPL-2.0-or-later. The FSF
> viewpoint is expressed here:
> https://www.gnu.org/licenses/identify-licenses-clearly.html
>
> Personally, I think this change was problematic.

Sure, but I don't think there's any reason to mix both styles, is there?

Best regards,
Piotr Mas=C5=82owski
