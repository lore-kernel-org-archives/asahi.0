Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6723D1CA1
	for <asahi@lists.linux.dev>; Wed, 11 Mar 2026 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773226348; cv=none; b=kjEcKgTltdDtvzyE8HetSEMy36kGrruIT9giPeTyxwyqVYsjtgZQg7ozfKkgCy5Pu1VgTzzX022ET/XslNGQioURfVJeQI1osrmD2nXscT7gdxOjejPfu4+dCD36eX+eXfShX6VeD/M08WBlbQ0zBEG8RzvjzxJ6jBjD9BTalEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773226348; c=relaxed/simple;
	bh=VTFbGjqMuCilNHDxgvaQ2CTafhfYnCrd0sXbQe7PI8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KOmU9t9PUzS4eRDAhfxSz7SGEIkLh3CVXDG3+mwR+qQkiPGZ2WtA7pUVLM7Cn+KIXmXI0XQT5VOf0oxSXA/Lx/6UZxWO1/VJsGSwCc7SrbGD2i7aVBTOYHh4FRNBDpI+1/+G1asSCAzkNMe62Wh+GwsuQ4IcYYxQwb9qYv/4CT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIJ3Kvki; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIJ3Kvki"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82980945556so2724769b3a.0
        for <asahi@lists.linux.dev>; Wed, 11 Mar 2026 03:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773226345; x=1773831145; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPTO/kKMdzOm1yb4HExAVv5DEVkwKacMrp7m0gdsATQ=;
        b=fIJ3KvkiQC3+BXirVniA+Z0RZZblspsRfDktIbpi+k2wj9jKMIhB/RdOfuoaUXEs82
         A1x1BQSpq9iJv+tQd77NZrb+Byyf3XAm7G6n+MVDvWMGMR+MgNLaA1DRuiPJ2hCN0vdk
         /UpNL51wZihlHFmydcUajl/ehTxdGxwCiKK2COA982nDKjW65Um1te7svTHOcOVPGFxD
         ERYQ+4qzDGwlDsYXX8VC594rWtkhWKDE+afyJetfSMFJHi2Rav9euR1oaLsS+OH3k63Y
         Yq6Z/wP/VTkO7MTxzkEtmlCverTeLt/9oOz+nf77HBqNp0V9KhnSSVN8m9Gw6pNhB2qv
         BqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773226345; x=1773831145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LPTO/kKMdzOm1yb4HExAVv5DEVkwKacMrp7m0gdsATQ=;
        b=QmzLLKfAFGmRZeT8bKO5BxBZLIszRw54EOmDOtSgZB1Fl8NmOApYLkk6MN6hMaJi5o
         qjOQ0MgF6hMoawf/f+QQ7wYwdFM4qXd+X6e8R6CaIJyC4l0ElUGUYWWNoj2r7g8dISAc
         mwCzYA4EvDREpQLsXQCwoIFCQWk7STgGQbkK7fDHXKqeM2TQ3QFn4Jq/OQaf+YlCrQDv
         V/NSUX0eigS+zES7wTyKWnihNGGVB5iWd+rb2DjwvecnorFESrhLtjGj+5VuS261n1LI
         kdyW7jn4VcE2/eBS1NxxSkv2llEVQnAOaOByDDws3Onxt5bKyWmW5FYguQBX8AfTt+Ox
         vxVg==
X-Forwarded-Encrypted: i=1; AJvYcCUakrJEF6ZKxGFShmSWc3cc5HOa4lbwDsNaM00zy9YEEFqKuvRK5Z3DStX/pQ1O48OXPwStKw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0UMRkgiCeUMcHrf1nffQdysEnB5JRf6O8Q7JMCvuvPixb/FZI
	LJC5vQ0tS9Vobp1v9AK8XJvOePv2PHWyB7/AwpvscwZ7JZE4+6nGA3pu
X-Gm-Gg: ATEYQzzbLz1X8xRf+oZUdSJ8gGgRL3Zt7hmDpqtXx3/7v+TIMwQCpl+QwptFUAzr7ZU
	98UQL3mrsWKkGMWBoH2/AYrCKH0zHa8yBx0HFq7ByYJqEsHeza4pQF4QGKS7Ye1HoKisg/XJyId
	x62mYAWK6RoqK0A8dM30N+2A00vn98OGewTwoEIWwv5cNhgW0LVf932fRM+T5yiS7fne5xcY7mP
	B1Nwbr2ACj4MKvn950ykuF6cBFl4QXEfHAsRy3x+/IeSYeJzSbrrDkUIulqik7enRg6NCIw86rl
	qH/CV3CN0hX7QJFBIEKGKzFiVASzQtKEJqon+yDa3ut2H343eRdLwr7OOnytZD5UTxczMrdJpxu
	vJi2krlIrI/mAmpLRbVM06tBbX4/ZosMvx5QLaEuywEwvpkq2r7apDhYq2k/fVQrCCV9QvVD0Be
	r5Tyn49L0HJDgwDu2oY/2DbvEcCNeF1p+WpAUCto4mVT2mAxkwF/pRefDbKmT6F4tiP9persA4y
	mgQWhEE+WE4fQ32EodD4AyDrn4wkzEyeTXoH6sq8TSt0oJ0sDpSWKozpdFPPfF0nVkb9cKuB949
	l45Vy1GYTFQuWA==
X-Received: by 2002:a05:6a00:9510:b0:823:c59:9cb0 with SMTP id d2e1a72fcca58-829f707348bmr2146847b3a.1.1773226345365;
        Wed, 11 Mar 2026 03:52:25 -0700 (PDT)
Received: from minako.localnet ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6df32a6sm2255620b3a.14.2026.03.11.03.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:52:24 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: cs42l84: set up PLL for more sample rates
Date: Wed, 11 Mar 2026 20:52:18 +1000
Message-ID: <3333069.e9J7NaK4W3@minako>
In-Reply-To: <ac417b14-dcdd-4e67-b1c0-b41ff1e22fc3@sirena.org.uk>
References:
 <20260307-cs42l84-rates-v1-1-1c55a5673031@gmail.com>
 <ac417b14-dcdd-4e67-b1c0-b41ff1e22fc3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Mark,

On Wednesday, 11 March 2026 4:51:25=E2=80=AFam Australian Eastern Standard =
Time Mark=20
Brown wrote:
> These are adding 44.1kHz based rates with a new value for MCLK (the
> final value in each entry).  Those values are read with a switch
> statement in cs42l84_pll_config but that only has an entry for 24.576MHz
> for some reason, that won't match 112.896MHz and will just leave the
> pll_mclk_f with whatever value it had before.  Don't we need a new case
> statement there for the new MCLK?

Yes and no. According to the datasheet, the chip only requires the PLL to be
in the "region" of 12 or 24 MHz. Since we only have 12 MHz region PLL confi=
gs
in our table, this does actually work without changes, albeit unintutitively
(and accidentally).

On 42L42, this is configured using the MCLKDIV and MCLK_SRC_SEL bits, which
behave identically to what we've ended up calling MCLK_F. I will add an
explicit arm to the case statement and a comment explaining this so that it=
 is
not ambiguous.

Regards,
James


