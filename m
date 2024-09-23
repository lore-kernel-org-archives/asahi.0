Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B381A3A81
	for <asahi@lists.linux.dev>; Mon, 23 Sep 2024 18:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727115570; cv=none; b=LFoRI8YrROAyAt3BX7ZCROhHOQq9QXRVFmtW7i0tdsPTRkYpbKtFGFC0CE6BuLIO8QlPeG4ZgBfqkmeAobTPA+uvYwy3qblKjXh9XmZWED79wcIPepCx4D1EbkrfwoVbe8WZWR5cgvlhI/MBaOC6ZJOISipzvcsC3F1nNerKxic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727115570; c=relaxed/simple;
	bh=5jrCWgKy6c4XVO9Lg3hj9B9apzoGLkDqi2vgJTVKkFo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TN2eVn4ekZc0OzPXerKFurRv5GHd5XisKM63wcOr7eXv2WtE0vrS8yz81kSFAwp+gkf4NulHL1fXMMniIDmsH3xPnNztgYsLar2qxp6DzQNIhts0TG/RlXqEIrNHiAIZ+LuEzEyRNYJnlZWGXPmy+6L8iy5csCkUP6oSpwvac5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UGfIfBxG; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UGfIfBxG"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2d9a2b8af50so5132848a91.0
        for <asahi@lists.linux.dev>; Mon, 23 Sep 2024 11:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727115568; x=1727720368; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JY1uJle74XQm0yf6l6izNHChhI79bQGWAHE9tPRlGlo=;
        b=UGfIfBxGcGjAwZIDA+7l7APpYPiNpvNte8GkipMXcOYiyNPC6kVtvcySMJ+rYsRqMW
         j0Ez0rTuo+6pDCEukG2OdrvpJirvYKuVSshtbNG/deCSvVKfhF9UTzeXtnezlBvrP+Zh
         cpk4jlHsmDLPOPXhnfLBOJGu1H6XZ8AYs2ebAIjY5BeIyLrkvPidaoi8A3YIWMGbq+Rm
         6MFYduT1gsETjN4J92LGg6ge2mJol5B4IE0mFns6E45Yo73x7hjZr6STgeKnXRwKqQWC
         pYnh6siom8P6lEEgv2hlWsMUHe58+mUbPBA3N+gBCKMdUuSLdE+LKCng9uPFmo6UDKVz
         aEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727115568; x=1727720368;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JY1uJle74XQm0yf6l6izNHChhI79bQGWAHE9tPRlGlo=;
        b=UrUIVeNQb0kdZxV4Rr8mMKDxxkBLpmFaBSLW9PSrct9gO8VSedasIqgL3UYOUo3dmV
         EwWmiA7N4LzpksG3RZzEHbSNIQro+IU0QAWUFaAeiBuMf6yG8KKZw3k/w1pcPimAyF9U
         kVao8P7UyfL+rpeRuRQz4lgBWQyswoONtVgsKZy8AoqRhIoQ24Y3ak+isqaJFMyn2o9z
         0K0i15geW1v1q5JskU5YwQSlp8/VGlgWxqOYjz17PJuFnsEiB1EVjdxlz3pTCHJjYvE4
         6DdXSjfOGdNGIr1LFzsl67ku/eDFtd6fBjt85/Agmk0m5THvm9L8LZFvQ2K6r/jcWWRV
         oyog==
X-Forwarded-Encrypted: i=1; AJvYcCWOU9Cww0smxRBuXoM48Uvv6B7Ln+H10udnyAe9sbPowyRIt5wwovhF/Ynkxz1+4ZkQk3gEDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFrXXPiTRuQvhpBlYiKduCRI7Dv6xbErWqtK2kl+Ori29SHvKJ
	j9KWhOxF/r5k3dmtNNsxIbQ4nEMk9Ku4Fp+6MjSzJyQpZn15cAtZEHth6jtL7nK024vf9ZvfxBL
	teViFX7HLFWx9YUCCjXKURBJAmg==
X-Google-Smtp-Source: AGHT+IHNkVnvCtV9wup56JFPDu+v4oNO+WNkshVpN7zdW5xRmKK1LUQn3oo3TLrHTIcCE4dCODTQF/nukTA4OVTuUJk=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:90a:dfc4:b0:2d8:f130:82ca with
 SMTP id 98e67ed59e1d1-2dd7f37f32amr22037a91.1.1727115567616; Mon, 23 Sep 2024
 11:19:27 -0700 (PDT)
Date: Mon, 23 Sep 2024 18:18:58 +0000
In-Reply-To: <20240923181846.549877-22-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240923181846.549877-22-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5089; i=samitolvanen@google.com;
 h=from:subject; bh=5jrCWgKy6c4XVO9Lg3hj9B9apzoGLkDqi2vgJTVKkFo=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDGkfN/J8stnqysVlvOzup6msyXMrlHSdXRROi0ZYNssd/
 Jxhu+ZYRykLgxgHg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZiIQjPDH2696a37j2mVT55z
 MH//p/VTdS4eVw40XcEkGnkxjv+enxbD/1KeQ6dars09xcH76NO5ZyFL7N9s8+uuMWp4frYuUlz HixUA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240923181846.549877-34-samitolvanen@google.com>
Subject: [PATCH v3 12/20] gendwarfksyms: Add die_map debugging
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Debugging the DWARF processing can be somewhat challenging, so add
more detailed debugging output for die_map operations. Add the
--dump-die-map flag, which adds color coded tags to the output for
die_map changes.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/dwarf.c         | 15 +++++++++++++++
 scripts/gendwarfksyms/gendwarfksyms.c |  7 +++++++
 scripts/gendwarfksyms/gendwarfksyms.h | 13 +++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 5fb9eadd782c..d2c6e91a7653 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -103,6 +103,8 @@ static void process(struct die *cache, const char *s)
 	if (dump_dies)
 		fputs(s, stderr);
 
+	if (cache)
+		die_debug_r("cache %p string '%s'", cache, s);
 	die_map_add_string(cache, s);
 }
 
@@ -549,6 +551,8 @@ static void process_cached(struct state *state, struct die *cache,
 	list_for_each_entry(df, &cache->fragments, list) {
 		switch (df->type) {
 		case FRAGMENT_STRING:
+			die_debug_b("cache %p STRING '%s'", cache,
+				    df->data.str);
 			process(NULL, df->data.str);
 			break;
 		case FRAGMENT_LINEBREAK:
@@ -558,6 +562,8 @@ static void process_cached(struct state *state, struct die *cache,
 			if (!dwarf_die_addr_die(dwarf_cu_getdwarf(die->cu),
 						(void *)df->data.addr, &child))
 				error("dwarf_die_addr_die failed");
+			die_debug_b("cache %p DIE addr %" PRIxPTR " tag %x",
+				    cache, df->data.addr, dwarf_tag(&child));
 			check(process_type(state, NULL, &child));
 			break;
 		default:
@@ -648,6 +654,9 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 	cache = die_map_get(die, want_state);
 
 	if (cache->state == want_state) {
+		die_debug_g("cached addr %p tag %x -- %s", die->addr, tag,
+			    die_state_name(cache->state));
+
 		if (want_state == DIE_COMPLETE && is_expanded_type(tag))
 			cache_mark_expanded(&state->expansion_cache, die->addr);
 
@@ -658,6 +667,9 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 		return 0;
 	}
 
+	die_debug_g("addr %p tag %x -- %s -> %s", die->addr, tag,
+		    die_state_name(cache->state), die_state_name(want_state));
+
 	switch (tag) {
 	/* Type modifiers */
 	PROCESS_TYPE(atomic)
@@ -693,6 +705,9 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 		error("unexpected type: %x", tag);
 	}
 
+	die_debug_r("parent %p cache %p die addr %p tag %x", parent, cache,
+		    die->addr, tag);
+
 	/* Update cache state and append to the parent (if any) */
 	cache->tag = tag;
 	cache->state = want_state;
diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
index 66806b0936e4..83b7eb8226dd 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.c
+++ b/scripts/gendwarfksyms/gendwarfksyms.c
@@ -19,6 +19,8 @@
 int debug;
 /* Dump DIE contents */
 int dump_dies;
+/* Print debugging information about die_map changes */
+int dump_die_map;
 
 static void usage(void)
 {
@@ -26,6 +28,7 @@ static void usage(void)
 	      "Options:\n"
 	      "  -d, --debug          Print debugging information\n"
 	      "      --dump-dies      Dump DWARF DIE contents\n"
+	      "      --dump-die-map   Print debugging information about die_map changes\n"
 	      "  -h, --help           Print this message\n"
 	      "\n",
 	      stderr);
@@ -74,6 +77,7 @@ int main(int argc, char **argv)
 
 	struct option opts[] = { { "debug", 0, NULL, 'd' },
 				 { "dump-dies", 0, &dump_dies, 1 },
+				 { "dump-die-map", 0, &dump_die_map, 1 },
 				 { "help", 0, NULL, 'h' },
 				 { 0, 0, NULL, 0 } };
 
@@ -93,6 +97,9 @@ int main(int argc, char **argv)
 		}
 	}
 
+	if (dump_die_map)
+		dump_dies = 1;
+
 	if (optind >= argc) {
 		usage();
 		error("no input files?");
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 16d4746aaef9..c913a2421515 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -24,6 +24,7 @@
  */
 extern int debug;
 extern int dump_dies;
+extern int dump_die_map;
 
 /*
  * Output helpers
@@ -46,6 +47,18 @@ extern int dump_dies;
 		exit(1);                                     \
 	} while (0)
 
+#define __die_debug(color, format, ...)                                 \
+	do {                                                            \
+		if (dump_dies && dump_die_map)                          \
+			fprintf(stderr,                                 \
+				"\033[" #color "m<" format ">\033[39m", \
+				__VA_ARGS__);                           \
+	} while (0)
+
+#define die_debug_r(format, ...) __die_debug(91, format, __VA_ARGS__)
+#define die_debug_g(format, ...) __die_debug(92, format, __VA_ARGS__)
+#define die_debug_b(format, ...) __die_debug(94, format, __VA_ARGS__)
+
 /*
  * Error handling helpers
  */
-- 
2.46.0.792.g87dc391469-goog

