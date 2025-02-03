Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786FC1E7C0B
	for <asahi@lists.linux.dev>; Mon,  3 Feb 2025 18:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738606650; cv=none; b=AXKxapsbMQR0f45kAIK2QQNZK3B5NiV9iAjc2zf5bsGWqbEJQea+BuiBDRI4D8zBr+6u6MW6xXullzkpTvy9wma5QxP9Mx09HJIQ8uRr2/laiUfSHtnVw5R8B9zbo+o2treBYyUXyMdizEEl64ulGRl76vjUudTClFZG4Hg7mtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738606650; c=relaxed/simple;
	bh=+oTVEI7ih4UQ6CaQVZkQ3pNuU5Lz8cH04p72iYkrp88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JaqsdAGrk/tQihocu0YiLYuY0foRkeJgoD6e+JD1i6C7vOa5PDnuy3iWvkEvZb3RJ1+rH4yesHuYYElIa2fP7NSjdW0KJoQ1QXe88dImCeXdaH1/P14hBFGEyu/33HFpscHO09pTnER/cOiQG8aGoYJwIzYE0pasbUzgEtKtK/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=id5yGakT; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="id5yGakT"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385dece873cso2220482f8f.0
        for <asahi@lists.linux.dev>; Mon, 03 Feb 2025 10:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738606646; x=1739211446; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDkxzxcu7O1vOggBOzC4wE/NAP+zsMC3Yt4mKkAp2BM=;
        b=id5yGakTUgsCE6nwu91wDLszhm6QLntnezPDyKFAkU52EU4IVCO5MXAR5lQ7EDsFOq
         JDWYtXSmMlCUVbTdV3fpjV1sVJoEGJ3lYa8YZWHY70OWAcScFm4sn4xkxxYz/d0Kokq+
         WRrFPhadfyv7Qm1/EzGnDniQ0TYxp73TqEIgEueOtiFaVrw3zTEOlpT4DEunaNE71+18
         rmmJMZAprAp/8MWyQkeL3JrwJCcK6U6T3w+bi9z4azOXixt9Z1pP7UrqW0n/gd3DgTpQ
         N2TiKI97/UsZU/x4X1/nySiciasJmrcEMtJlp+z5Rk0vc5uCprahht/UBOa8+1uDt70l
         ZLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738606646; x=1739211446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDkxzxcu7O1vOggBOzC4wE/NAP+zsMC3Yt4mKkAp2BM=;
        b=DwuX2MtDr8wMvPde8avs/sAEmHM7IY7Qua1N+1PRiq7FyQINrnlKyLsZMC+BkhHKum
         r+sCL1lnIbDrPPpHEOe70ObgjVY/FC+aERsiwPFo2lWZRz3rPSz/kZPP0T4bu8Aqer4a
         Y7w2w2VPmthBlhTNLX3HX0Tl7L96dieF71e5qLJlHjm5i9f9tSAtjz799/6smaml2Jh4
         GvBa++vmhjlqOoOysx2lFQMmkmGymuxbD0SUbcsTM1B+PGBWISiIRoPSc8pXs72guWA2
         jHnXIO2RZ/Jfir5In8pEfGYfVvX+vqCFkhDPcydEPrPmA/5w0nVPk+vbyCaLgWka4mXi
         a2qA==
X-Forwarded-Encrypted: i=1; AJvYcCVmevIYCBEgxIDsw74apbwB0egUsgbCWxNWYBm5lm+vg3tUKNQQ5BPheDJMA9MH9R0stnlEnQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVk0aNMq7mvWYTP2mRedQo23bqlNgUbeANRH5qgIbaXL6tLiDY
	n9kyzWfH6WQNwhwhe+zretNsIkFnqOLH2kNg2a7N2tqp1SoP1wZby0fHNoowsjqGDQPSs6p3nTq
	BtT/NR2csH8WEOtjz4PDRkKwrPvkAFD1JiLF6
X-Gm-Gg: ASbGncujC5mDrIgLBL52AejXUd3dfcnSjvkq0TpE+32Cn3WnaWp3FpxJySfSOmwHCNQ
	ZSGPeE5d/GBO2JNFXERZJWG2uBL9PskMfuzjzrSBbmbfueDdvDQDX1badcRWsDhLlEHwN1QXPyw
	==
X-Google-Smtp-Source: AGHT+IFjiAANHpU4lYhLwjIj1aIzAMCx+jP5Z2qXe2xs3JQXXbYoy6fxWH9MRWQ5Z6+cy+ed9B9IBPZfiojUyR3Yru8=
X-Received: by 2002:a05:6000:2c5:b0:385:e013:39ec with SMTP id
 ffacd0b85a97d-38c51930b44mr17922172f8f.8.1738606645674; Mon, 03 Feb 2025
 10:17:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <20250202-rust-page-v1-1-e3170d7fe55e@asahilina.net> <CAH5fLggscATtCgQwCYSms77oSFOMkjTscRDqAOZsSgoHsOoPQw@mail.gmail.com>
 <def0ac4e-6ec3-4f91-a3e6-02ce931c46f3@asahilina.net>
In-Reply-To: <def0ac4e-6ec3-4f91-a3e6-02ce931c46f3@asahilina.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 19:17:13 +0100
X-Gm-Features: AWEUYZmdD1lRFN2B0MxC6_5nwF3LFE7h8SGB6KozvokrQeCQEKJgmX-DPDC9T_s
Message-ID: <CAH5fLggcT0_e3EsBppxsGfxaqvs6rTkbbRvrFEHthEff5s1x0g@mail.gmail.com>
Subject: Re: [PATCH 1/6] rust: types: Add Ownable/Owned types
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>, 
	Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 3:17=E2=80=AFPM Asahi Lina <lina@asahilina.net> wrot=
e:
>
>
>
> On 2/3/25 6:13 PM, Alice Ryhl wrote:
> > On Sun, Feb 2, 2025 at 2:06=E2=80=AFPM Asahi Lina <lina@asahilina.net> =
wrote:
> >> +    /// Consumes the `Owned`, returning a raw pointer.
> >> +    ///
> >> +    /// This function does not actually relinquish ownership of the o=
bject.
> >> +    /// After calling this function, the caller is responsible for ow=
nership previously managed
> >> +    /// by the `Owned`.
> >> +    #[allow(dead_code)]
> >> +    pub(crate) fn into_raw(me: Self) -> NonNull<T> {
> >
> > I would just make these methods public, like the ARef ones. Then you
> > can drop the #[allow(dead_code)] annotation.
>
> Does it make sense to ever have drivers doing this? I feel like these
> methods should be limited to the kernel crate.

Not having drivers use this is the ideal, but I don't think we should
always expect it to be possible. The Binder driver has a C component
for the binderfs component, and it also has some code that's
essentially an abstraction inside the driver that I was asked to move
into Binder because it's so specific to Binder that it's not useful
for anyone else.

Alice
