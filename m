Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939E13E1CEF
	for <asahi@lists.linux.dev>; Mon,  6 Jul 2026 09:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330315; cv=pass; b=csruhjGzoFtrdv0ZVKUeoS6UgboT+l1ZMA2o8lWWojsc7QproPOJC8Z+lx6G4DRnz9ogCwjf7UGsSDyjdt9pkiIp1AjBUeLfSTiyUNFes14YraU6jBxJYnifCAFeapNJ0QvC1ulci4kYZjNpgzed1yxu1Bgwfk9LzqvsuuJ5LmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330315; c=relaxed/simple;
	bh=qLi6fwh3IzyaFatziFr+a5GZgkDzhLFniPy2Vc5e/+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=skJzi32aXc29U+MNrHPKymkShbDSPxJRFG5f0fcrqv9xiT52DzherF3QlV7AcQPCukUBnRkJWVf8S3GGFc7+0dEk5Jo9b1qVxoYAPZ1+7NLV+QhjMx7fQKXUCf2b04SHI+fZPdD4CzDBr28PRcPQTJBwjN4xRwHGgXHExAdQlBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEhKeG6d; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEhKeG6d"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so750583a91.2
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 02:31:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783330312; cv=none;
        d=google.com; s=arc-20260327;
        b=EB040R2iiyDABqHXkKDZgL8QPrcCrNfWwwVtworv62YxXgaP7X0KpPWWSCiHxfs6zQ
         vRCixO9azoJsT1C0/w5rNi5mFFoeyLqIgbv0QCDCqUhbz83dcRgL7/wlA4bFSz+oZWuZ
         Wfa1pp9COVvRBEtxXMamfVcS9gx9mICigN2iE0af0HLoxqOc5ZwWo8Gy3bTU3/s8Oerg
         gbJNwFxbxMtGniT9fDvy7HlI9Axb25PFtzYZHzT27YbAmlLoBf/M5yfMTeWOGoWMDs0b
         JWRka5/0c+IuvMOrs/oX3H1URnyrabOQWGSBxWGFsVti5LH9siu8lcMZoJe2aTRMcngJ
         cqaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qLi6fwh3IzyaFatziFr+a5GZgkDzhLFniPy2Vc5e/+0=;
        fh=DsUw1Pzxj86RuCIz1PaFYluCjKlfCKa2IbhzGnDBQnY=;
        b=m2HQsw0PGhkMMDZxXOXu2GXkSgvaks5cfWWRZVG8wt1vYxrcs/eXZYOIiWvTaX5pQB
         8x8Ol1KNqZ0KbWA9yZQSSGoGAz4eIN93tTY6Apuo5CGXU7y+rCOG8E71tc0Ddh2wIgzs
         GVZFGDxLMJipv+Ozr/50kqNYA/XqsN+zzR4MacqCctFxuxx0ZpWlK1kdpVz2tAtNYkTy
         Pn03oRvS6ICCYSFOUhAy+UyPIgns0g+9Wo7LG9nFvAjssQbsM+Rp6U8aOqHZuwB2SZ+m
         ex5LGvURijv2I1niHnHdosLN/Xy1GWULv9aOTSxUtUnkeIpmqsE6mTr2/4Yh4rQL/xLh
         YWBQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330312; x=1783935112; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qLi6fwh3IzyaFatziFr+a5GZgkDzhLFniPy2Vc5e/+0=;
        b=SEhKeG6dsomOI5cLVssSyPx19ozGd0vhAqdq5hl21kHKNpyT8O2FppDVh3/qX/IdP3
         dnxm/H+UeY7QHYH2olG+j1EhBaQmOi0SCfrWVxHA7v5Lm2kPjSSVhhzR67KfpnwIMO1p
         oQt7Ag6IR0YSX6fORSNOMM4b9bkf4huEOPkFy1J5o1p42zfCJJUkx+B5Aj5AFsAp7IFh
         Foqb3h78TOBwYg9s3CrUB0ELpxb/c4qTC3gg+400vtDVcyr/zxD3ZrRYSmDsCUMt3bu/
         Kr+PXbW7CqRlhgzduz9FUvW/nRwDTgpo/LATFql9d1IlGCxydQ6Plr8ejMk7+O5d1qQy
         3Xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330312; x=1783935112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLi6fwh3IzyaFatziFr+a5GZgkDzhLFniPy2Vc5e/+0=;
        b=XGsGdblaYd3RogG9KZQa4sHzm741OARYqt9AyuA/I32wALS2BNY/9nkaHXmmHHCHo7
         iAjgaFigr6EzasVU4zU+VhMv6la/RHshzsEtn74t2nMMD745RPqj6fsotKgcbST/VFNu
         NqWjRLTdfkjdmnv/hJM1XIcJMAeC5NY4HDKzN/nUjVZ7ttLN/aVGTXH486LlWT8VW58V
         QVyKThFNkzX31aUWEdD0wr75fReLlaulK/R4d2Csh3DW1rKBrEM4bkkYkbGc5NogiazJ
         gngpsQ2uBmLU58gdo9LhBruiymxqVbJjuwafgJJhCadLEFqcYtbd44Y7axcNtXWtCtbI
         UWQg==
X-Forwarded-Encrypted: i=1; AHgh+Rqxi3q7YPagNHvOCqouoPxguA7B4HSaIfTBpP8lvrel6K0h8ztCviGxnjVwqzFbNijBzzJXog==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7h13ZNUByTLb7OQud6pNOm2uWNqzXxh38a3R1XU2oPKqb1kjA
	USRMaLs2eXljYUlNG1CQFHwq3ORgM4TUwxuwwKbnr+03lwEs/IC2TYxPDOPFBhC1maSuWR/AKUw
	ytNBdRGZjlGbiuxsqe2CogIMOchOASAY=
X-Gm-Gg: AfdE7cmfgpWrZYWLBeKNnETFEIDXbV0BNuJC+6xvB3MuVojfLS8+oxNWjawZlKU91el
	Zw680bjwhqzvUomC59RHvgiNtLPKnI3OLxygl+DiSWpvADoXZko9wgdYNU1R6NvYZ6Bc7RC5ODo
	66jahL8EYQ/cA7gPipA2vX/BkRrNK83bTGKm6tmw9MKOeOsbxQufgOMl6bzIB2t1U0f7r/ZH56k
	pSNE60UCdOhKWIySFm/9Yu5ASyFjDwLL6wRiZmcl4vUnq+fLI1d5sf7l59J/1m2N14obcP/6BY4
	U1J+bCDirfXBa1nyCq0i07a0xwI6Tn6CKD6AWA==
X-Received: by 2002:a17:90b:3b87:b0:36b:77b9:5c8c with SMTP id
 98e67ed59e1d1-38293b99461mr9146796a91.17.1783330309463; Mon, 06 Jul 2026
 02:31:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626061329.23264-1-phucduc.bui@gmail.com> <20260626061329.23264-14-phucduc.bui@gmail.com>
 <c6bb6d40-d539-4018-82e8-7aadc28b98f5@opensource.cirrus.com>
In-Reply-To: <c6bb6d40-d539-4018-82e8-7aadc28b98f5@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 6 Jul 2026 16:31:36 +0700
X-Gm-Features: AVVi8CcjV27A_4YHtL-aIf5btTq-bmQ7yClBnFPWKFVrjKx_yBqikhyITmOlrqQ
Message-ID: <CAABR9nEx4MCgBJNm-+jYLmAZJLPL-PoOXDwW_yUubHpdZQSJrw@mail.gmail.com>
Subject: Re: [PATCH 13/24] ASoC: codecs: cs35l56: Use guard() and PM runtime
 scope helpers
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Cheng-Yi Chiang <cychiang@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, povik+lin@cutebit.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, chrome-platform@lists.linux.dev, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Thank you for your review.

>
> Should change all the error returns to directly return IRQ_NONE.
> It looks like a bug that it checks rv but returns ret.
>
> The reason for ret was so it could use common exit code to
> pm_runtime_put() and mutex_unlock() for the error and success cases.
> But this isn't needed now.
>
> The local ret variable can be deleted.
>

I sent a v2 a few days ago.
https://lore.kernel.org/all/20260703055355.244898-1-phucduc.bui@gmail.com/
Could you please take a look and review it as well?
If there are any remaining issues, I'll address them and send a v3.

Best regards,
Phuc
