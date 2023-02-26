Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F832560
	for <asahi@lists.linux.dev>; Sun, 26 Feb 2023 14:27:02 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-536c2a1cc07so109528517b3.5
        for <asahi@lists.linux.dev>; Sun, 26 Feb 2023 06:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGH9kXSraDN+mVD9fqltVHucO9c601DRLuGoJN4kmTQ=;
        b=QaX5VGmC41VJmIz8TPU/W9pU9Rlq9pZ/fyEg+Y2vn9A1f8ToZJReD9OrGqJ+DTKLRD
         ns1/z9DlMNvs6CUQN7zDHeudlxt1ro/FaxhLR78SSphz+727jJALOFuSJBjiWbxLsj4L
         S7krOunD0mliF8uwQvIlK6TtZ5l2L0kySnNA9lZ+vU9GHTrjl0DgynOjiTWfgxsZO6ot
         q16VJY0Tex84DLUmC12L+ZLNI93kDG9RuQ1boJ+xK1cNEIl0OSUBvueq0do2L9rmZRAp
         HZsnO6EQQWLCdo1OM9TxtRSJCXCNn+c3H4LijfegmZqH0LIdbLicdKPx5vS/we4W6X9x
         V84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGH9kXSraDN+mVD9fqltVHucO9c601DRLuGoJN4kmTQ=;
        b=Z48BMV1YUXccAUf4TS1K8XM9s3INy6KGrcnQqJgAHpKyC8shGjSlbIoe/+24NnbdbS
         YzmTPRLeh6gnwNXfNcUinpndxc8y5XuKOSOJ8UAl7LxgsjBU477lNa3B65ZVQ2IU8A5B
         L6JN5uU1Xp/Ap0ErGV3Z7zT+9/S4OLsRh0s0ofmHjyCSOhxa07ttVbDox4N4HQKVr53L
         Ovd+KBq5Cfq/nQ3ygBTxhGs8TxktJhj+jbXgdb1ZQb2uykh9wSg6tPhzncahqHMSz+ny
         qhSicy4e4NASw/HELfvZZ13mCqviiF8lXnJ1X8iTKk92cwpebNbyWdtV34XtbR+kBBP1
         KPCw==
X-Gm-Message-State: AO0yUKUzaBPf8NRBPdxGJeR+EsUan+p45Je4dlgkGscgmG5BHqxVGGFm
	sw6WB+O1IL1SuodvrQ4kepz69+Q+wqaa8fEVxRY=
X-Google-Smtp-Source: AK7set+BtJD8RCDTOmU2TeKNwV20RDhvx+4CTS3ldjyAjzOcc5t/EOb7HDEA56Nq2rWGpj4W8kY/ScQOG4rqMg4sfDQ=
X-Received: by 2002:a05:6902:1:b0:a27:40c4:e12c with SMTP id
 l1-20020a056902000100b00a2740c4e12cmr6759616ybh.2.1677421621166; Sun, 26 Feb
 2023 06:27:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224-rust-error-v1-0-f8f9a9a87303@asahilina.net>
 <20230224-rust-error-v1-1-f8f9a9a87303@asahilina.net> <20230225221405.62e989c8.gary@garyguo.net>
In-Reply-To: <20230225221405.62e989c8.gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 26 Feb 2023 15:26:50 +0100
Message-ID: <CANiq72kOb9mbh4HQzH40Ey+Rax3vREsd0Nf2O0apjDpsboE6vQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] rust: error: Add Error::to_ptr()
To: Gary Guo <gary@garyguo.net>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Sven Van Asbroeck <thesven73@gmail.com>, Fox Chen <foxhlchen@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 25, 2023 at 11:14=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I know that we already have `IS_ERR` in helpers.c, but having to go
> through FFI and helper functions for something as simple as a cast
> feels awkward to me.
>
> Given that `ERR_PTR`'s C definition is very unlike to change, would it
> be problematic if we just reimplement it in Rust as
>
> ```rust
> fn ERR_PTR(error: core::ffi::c_long) -> *mut core::ffi::c_void {
>     error as _
>     // Or `core::ptr::invalid(error as _)` with strict provenance
> }
> ```
> ?
>
> I personally think it should be fine, but I'll leave the decision to
> Miguel.

On one hand, we have tried to minimize duplication (and, in general,
any changes to the C side) so far where possible, especially
pre-merge, doing it only when needed, e.g. for `const` purposes.

On the other hand, being in the kernel opens up a few possibilities to
consider, and it is true it feels like some of these could get
reimplemented, even if not strictly needed. If we can show a
performance/text size difference on e.g. a non-trivial subsystem or
module, I think we should do it.

If we do it, then I think we should add a note on the C side so that
it is clear there is a duplicated implementation elsewhere, avoiding
future problems. In fact, it would be ideal to do it consistently,
e.g. also for the ioctl ones. Something like:

    /* Rust: reimplemented as `kernel::error::ERR_PTR`. */
    static inline void * __must_check ERR_PTR(long error)
    {
        return (void *) error;
    }

Or perhaps something even smaller.

But I don't want to block the rest of the work on this, which may need
some extra/parallel discussion, so let's keep the helper for the time
being. That way we can also do that change independently and justify
the change showing the difference in performance/text, if any, in the
commit message.

Cheers,
Miguel
