Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12F8746B
	for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 16:12:04 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id r5so7214966qtp.4
        for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 08:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HVS+XAReNIqkEZr+HHhHNoC0XqayQ7uaPTuLvcoutJg=;
        b=lk0sxdpjwkeffBxkze1r6VZFwx01PQ5+VQC/bTgDkHrhafr0dPo82eurd/Hq/t5dHL
         0Aj0T2gcA0Ix4rquId5YzeFAfJEQRBOmfYkJIlyMi8KTNhHprv1/5Wkf6riYC2qvlZ9p
         +lqitZkHTpPoORHMIomebpTYdRfkYhoMvF0jgTBONGdWwpLKe93WLpDqyclL9Glg+6p7
         3GGZQDag+OaslA5no/LhLpn1KzLZlCl94EXhzk6yB5mJyUSjzgKmiE5NM36xFnKPIJ9m
         bzsyHe48ElQPIg1LjHxEx3sqqbsFrd7daWOF9ZFT/XPeuKvKcJkpsp1ohyDGSP06PEm1
         gajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVS+XAReNIqkEZr+HHhHNoC0XqayQ7uaPTuLvcoutJg=;
        b=0OSjfss0Mu3SZLH5pyym8NLJifOwFpiEWF8lZTDi+L6yXSndPLPk5xFxGDJUzkx1uo
         XSHr4hAFCFsKzdr7PXCAjFko9rs8ctzJbD+Zvj80ArkrJmF2jaREYXG0J6SGpJTP0jgj
         lVCoYoBI2Haa/shp+n5rp3QxWkTFcz4H7c4HMNa+xsUBFYfq3RPFrSL/opl9nL7wXkiL
         krvoETbfRlK6/k2VfhWiiOfc16bcXrRLgGSwWSkvgd0W3Mm7mOwupI6Oet6EWFPR6Pmc
         pVmJd1vejQU+666v459kEIMoHyoyAyB/PJ9F3DZKLUiPbWhXAnHsWc+BjQ4RM2SjePRn
         vB1w==
X-Gm-Message-State: AO0yUKXai0b1eCmjS5kh6fCjXWnW98wJG5SscoCdmb9zPTC6TylqtK8S
	JWVFuSJzxmNk6nwSpuF3hDY=
X-Google-Smtp-Source: AK7set8DE/smvk2iugB1Wlsd5cvyAWVwCrm5DHYixBwAorNNTxk1UunRx+yF2yQAkpbX46ZK/yVgHA==
X-Received: by 2002:a05:622a:18f:b0:3bf:aa39:982b with SMTP id s15-20020a05622a018f00b003bfaa39982bmr32687063qtw.32.1677514323651;
        Mon, 27 Feb 2023 08:12:03 -0800 (PST)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id n188-20020a37bdc5000000b007425f242cb8sm5144325qkf.66.2023.02.27.08.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 08:12:02 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailauth.nyi.internal (Postfix) with ESMTP id 7D53927C0054;
	Mon, 27 Feb 2023 11:12:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 27 Feb 2023 11:12:02 -0500
X-ME-Sender: <xms:UNb8YzVn8FT-9qP6SjrCPvxjqIjt2A5On293QHEHdZGkdX9pny1Q1Q>
    <xme:UNb8Y7mr54l2qZxmzeyZM9yRhQ5Bc4uSHAgF79ICRv7IA5pljWgiWcSo302BeCjkH
    3wsXx9TVNqcNYrLYA>
X-ME-Received: <xmr:UNb8Y_ar2I925ZgRm_KZdaLgCgrXWN1KxDshAAt82lo0uXHrYeF_QDJdzzc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeltddgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhepgeekgeettdelffekfedtveelueeiudevjeegieekvdegkedufeetfeei
    iedvueelnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhht
    hhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquh
    hnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:UNb8Y-WnawlW9HJeO3csrPPAPLflnOiv0Ilzx36YoyYjliaXZfd4jQ>
    <xmx:UNb8Y9n-DVVdEbziGEB3qz7Zcd_a_IShmvQ3na6f-FI4BBY4HB_wjw>
    <xmx:UNb8Y7cU32gY1lIBL1SuzBmfcVrYU-cxp7_b6dmy_oa3oIIOfKLzMw>
    <xmx:Udb8YzfDT6D-ZHbriXkmHTvvhiUa8QI8d_x_Uq5-e9Mb8iuK6dvdyg>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Feb 2023 11:11:59 -0500 (EST)
Date: Mon, 27 Feb 2023 08:11:27 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Asahi Lina <lina@asahilina.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Sven Van Asbroeck <thesven73@gmail.com>,
	Fox Chen <foxhlchen@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH 5/5] rust: error: Add from_kernel_result!() macro
Message-ID: <Y/zWL4aeIRbvwKMI@boqun-archlinux>
References: <20230224-rust-error-v1-0-f8f9a9a87303@asahilina.net>
 <20230224-rust-error-v1-5-f8f9a9a87303@asahilina.net>
 <Y/lOlcSpc+d9ytq/@boqun-archlinux>
 <20230225222340.34d749ee.gary@garyguo.net>
 <Y/rCU1S+GDgIojNf@boqun-archlinux>
 <20230226133606.583cd1d8.gary@garyguo.net>
 <Y/uiAfZnfbbMrQuD@boqun-archlinux>
 <CANiq72kTiHF76T0AycM43qj4rUgQpHzBqXujdvk+H2qoDz22AQ@mail.gmail.com>
 <Y/vZdv6IVmrcP7wR@boqun-archlinux>
 <CANiq72kHe+BD1ZXjDQD_vWrpx+nBfy8fkjhHa8fx=3Bpk+Uuug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kHe+BD1ZXjDQD_vWrpx+nBfy8fkjhHa8fx=3Bpk+Uuug@mail.gmail.com>

On Mon, Feb 27, 2023 at 01:10:39PM +0100, Miguel Ojeda wrote:
> On Sun, Feb 26, 2023 at 11:13 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > Interesting, sounds like a missing feature in `rustfmt` or maybe we
> > don't use the correct config ;-)
> 
> It may be coming [1] (I haven't tested if that one would work for us),
> but in general it is hard for `rustfmt` because the contents are not
> necessarily valid Rust code.
> 
> [1] https://github.com/rust-lang/rustfmt/pull/5538
> 
> > "Yeah" means they have different behaviors, right? ;-)
> 
> Yes, sorry for the confusion :)
> 

No worries, English is the one to blame ;-)

> > Thanks for finding an example! Means we did use return.
> >
> > For this particular API, I'd say function right now, `try` blocks if
> > avaiable.
> 
> Do you mean going with the closure for the time being and `try` blocks
> when they become stable? Yeah, I think that is a fair approach.
> 

Right, and like my original suggestion to Lina, don't use macro for this
one.

Regards,
Boqun

> Cheers,
> Miguel
