Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB93C221D89
	for <asahi@lists.linux.dev>; Sat, 11 Jul 2026 01:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783732192; cv=none; b=Rnj8OCCmzFc2Dl9tYf5ofGBoACNyQ9KMYxLv6O/xIoSIul5rNoOz9kqOJZjIQ6nYvdEA5jcfzSbix9Cjr9s/9B8rC9utYGImteHZ8Ip0+xvrGqAQ312ZAAK2yzNUaPsVXzEICxK7SCIgF+JFMACEoJD2hRcjBmAPUSq5LYAxx8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783732192; c=relaxed/simple;
	bh=ug0y6mP0R212IqZ960j7rjGANnGythjIR2K0a6Zc8y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VdWw393wdsUIVyvBMNmBut6iJ9OXTJtYtiQzQ9hgBl/M9s6IkD/F76E/tPeaeqCXQ2eVBWZaNmlBx+mLIFv8eh7ACl6TXxixTX5/J4H72/fB0eXqZ2hjDIR/I/asIVQ2i58iSU8OfZDYzZ/rSVoGfnZDNfV0DpLbEg4VnKSr3Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hC/ff7bq; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hC/ff7bq"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38101f85591so1941233a91.1
        for <asahi@lists.linux.dev>; Fri, 10 Jul 2026 18:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783732190; x=1784336990; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SVwzljcoSLFxXAkpDsnmneyS1Y6KkO0TnKfWfmJr5FY=;
        b=hC/ff7bq0Q/8ei/EUErJvL03fEtgrbNzdB4klxsZUDGgItPkyCWeraTkTUD+SDpRMG
         8hFliYMFaJFhY7yGzQSp8saLTQE0kIIkFFaMTvwYZY2gHa208uD4B1FlO2Be2cvgKb7P
         r80pBJqxvLPfht+psPPghPgzS0mfSOG8HPJ4IL11L83rZmMUhvueImPQC/gTUdwjhQAx
         iJCTlYwt7lonlNbO1D5c8PSPP1g+xwOYcspSY9k3ufNBECWk21+qDq5ocrg2pv5qo6/2
         d4B8e/BdJenvGKybnSg9EB0YfMxS0MQC7ptCexPDtM5ScqC1nQQiu4x0S2iMXG0o7nuz
         gUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783732190; x=1784336990;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SVwzljcoSLFxXAkpDsnmneyS1Y6KkO0TnKfWfmJr5FY=;
        b=qn1z8llEcytx8ZCeeDioXm1FCmn5uGmXh63UTcrTiitJ5NGP7OvAWRNXe0kZI4ezXB
         Cca8sdQr8deyryDE7IZwn1l93UfiR+CW/PRVhfWjmi1ejgzzZf+6b0uzW88TAJ3wJWnU
         69RVm5yDe1Iwo+xLxXSxC8zWcTn5GfLVmUHFMMzFMYof+Ql5S0USDfOZM2sAMhfFN+KR
         ewz1M+IF7fzB83Vmuq/1Ist02qTR+SowzNvZvv0lnLTQGRZY9gbjG4Am6h846MXEpi+J
         evQktEaHDF+Yv4CDfsFbLZjv3z1SyDXA+iWvazt9duvkusuV/DT3UBUw6bJdqEDyDQog
         +zqg==
X-Gm-Message-State: AOJu0YwOZtBw9i8vNTkvArVSctfd5NZRBkqAQrgQLrDvf1cd4ou1NXqI
	2MLhvg3mVFuPIJD2IhFfl413B/fU7nEEzBFb3cvnVhfUfAOir6kux2Ql
X-Gm-Gg: AfdE7cnVF9Qtcyv4GsgB9ULQ6mH+fg8wghw+TkqykLmvIt4TUnLE19mDS/eQwa2D6yQ
	toVXDj9XAYbSe+G+aJv0eSqrUydH9B9dpCyiS6Ru16XH7Gb7Hs7jCaffgGHem+iHSv+vaz/PKpD
	mB+k5NbVZiE60fv4bjq1MvFPpByB9fNOJhaRtchB3nEtVdK5d+NdzxkYJWIHuI+pQ/gHHjV9OxY
	Wffscesuvg11T54cZgWEnaEXE06RDsBPxJ3ixUN41lULBdkGKB+jxQAMWztlyEYJXFRieL4pGE7
	9jZRtUQwmrGvxBtFYRQuBRD5BZQrvKzau0wp68tDQzoDrbAv77XxjxzsJzGuCGVtGdK3KE3dFg2
	56AKv41H9on/27E2X4J67CgJR6W0ylRYPWWyXitBWf7RIhl10rRfxHcRbCl+dWiwUNIk/9AhuXX
	8rD6hcgwY87xw0vAu2h6HV1nVHPCqEnjDBRvucWWsEZ3Pdsx6ptd0VY2opdM/o7hZQc6rsGEqsi
	YAqfZWEH0+RwchK8J04Zz1ffJeymYPkXaYuQ97XP8DcSu3CIu7C3LhQ1UnPsFuTd1M=
X-Received: by 2002:a17:90b:57ec:b0:387:d9cc:7dc2 with SMTP id 98e67ed59e1d1-38d16085723mr7470659a91.20.1783732190004;
        Fri, 10 Jul 2026 18:09:50 -0700 (PDT)
Received: from minako.localnet ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311950eb930sm27882042eec.8.2026.07.10.18.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 18:09:49 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject:
 Re: [PATCH v3 0/7] ASoC: apple: mca: support simultaneous I2S capture on the
 frontend
Date: Sat, 11 Jul 2026 11:09:44 +1000
Message-ID: <6zRExDMwSfK20K7px8nPtA@gmail.com>
In-Reply-To: <c9bd227a-cc37-4fd7-be3d-b7502f52fbfc@sirena.org.uk>
References:
 <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
 <178370665528.82617.13561476084775898427.b4-ty@b4>
 <c9bd227a-cc37-4fd7-be3d-b7502f52fbfc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Saturday, 11 July 2026 8:24:11=E2=80=AFam Australian Eastern Standard Ti=
me Mark=20
Brown wrote:
> On Fri, Jul 10, 2026 at 07:04:15PM +0100, Mark Brown wrote:
> > Applied to
> >=20
> >    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
> >    for-7.3
> >=20
> > Thanks!
>=20
> No, it's not, sorry - I backed it out due to the build failure and b4
> can't tell it was only pushed to my ci repo :(

Argh sorry, this function moved around the downstream driver a few
times and the branch I used to test these patches at runtime still had
all of that churn in it...

=46ixed for v4.

James




